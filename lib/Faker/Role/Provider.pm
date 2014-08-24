package Faker::Role::Provider;

use Bubblegum::Role;
use Faker::Failure;

use Bubblegum::Constraints -typesof;

with 'Faker::Role::Formatter';
with 'Faker::Role::Selector';

has factory => (
    is       => 'ro',
    isa      => typeof_object,
    required => 1
);

sub parse_format {
    my $self   = shift;
    my $string = shift // '';

    if ($string->asa_string) {
        $string =~ s/\{\{\s?([#\w]+)\s?\}\}/$self->process_format($1)/eg;
    }

    return $string;
}

sub process_format {
    my $self  = shift;
    my $token = shift;
    my @args  = @_;

    $token->asa_string;

    my $factory = $self->factory;
    my ($method, $provider) = reverse split /#/, $token;

    my $object = $provider ? $factory->provider($provider) : $self;

    return $object->$method(@args) if $object->can($method);
    return $object->random($method);
}

sub process_random {
    my $self = shift;
    my $name = shift;

    $name->asa_string;

    my $data = $self->data;
    my $samples = [$name, "format_for_${name}", "data_for_${name}"];

    for my $sample (@$samples) {
        if (my $array = $data->get($sample)) {
            my $format = $array->random;
            return $self->parse_format($format);
        }
    }

    my $failure;
    $failure = 'Unable to find method "%s", data, or formats, using (%s)';
    $failure = sprintf $failure, $name, $samples->join(', ');
    Faker::Failure->throw(message => $failure);
}

1;
