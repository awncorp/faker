package Faker::Role::Process;

use Faker::Role;
use Faker::Function qw(confess);

with 'Faker::Role::Format';

# VERSION

has factory => (
    is       => 'ro',
    isa      => FAKER,
    required => 1,
);

method parse_format (STRING $string = '') {
    $string =~ s/\{\{\s?([#\.\w]+)\s?\}\}/$self->process_format($1)/eg;

    return $string;
}

method process_format (STRING $token, @args) {
    my $factory = $self->factory;
    my ($method, $provider) = reverse split /[#\.]/, $token;
    my $object  = $provider ? $factory->provider($provider) : $self;

    return $object->$method(@args) if $object->can($method);
    return $object->process_random($method);
}

method process_markers (STRING $string = '') {
    my @markers = qw(lex_markers line_markers number_markers);

    for my $marker (@markers) {
        my $filter = "format_${marker}";
        $string = $self->$filter($string);
    }

    return $string;
}

method process_random (STRING $name) {
    my $data = $self->data;
    my @samples = ($name, "format_for_${name}", "data_for_${name}");

    for my $sample (@samples) {
        if (my $array = $data->{$sample}) {
            my $format = $array->[rand @$array];
            return $self->parse_format($format);
        }
    }

    my $sections = join ' or ', @samples;
    confess "Unable to find data or formats for ($name) using $sections";
}

1;
