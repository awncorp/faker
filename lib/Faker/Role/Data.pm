package Faker::Role::Data;

use Bubblegum::Role;
use Bubblegum::Syntax -types, -typesof, 'merge';

has data => (
    is       => 'ro',
    isa      => typeof_href,
    lazy     => 1,
    builder  => 1
);

sub _build_data {
    my $self    = shift;
    my $class   = ref $self;
    my @parents = do { no strict 'refs'; @{"${class}::ISA"} };
    my @data    = {};

    for my $class ($class, @parents) {
        push @data, $self->get_token_data($class);
    }

    return merge reverse @data;
}

sub get_token_data {
    my $self  = type_obj shift;
    my $class = shift // ref $self;

    my $handle  = do { no strict 'refs'; \*{"${class}::DATA"} };
    return {} if !fileno $handle;

    seek $handle, 0, 0;
    my $data = join '', <$handle>;

    $data =~ s/^.*\n__DATA__\r?\n/\n/s;
    $data =~ s/\n__END__\r?\n.*$/\n/s;

    my $map = {};
    (undef, my @chunks) = split /^@@\s*(.+?)\s*\r?\n/m, $data;

    while (@chunks) {
        my ($name, $data) = splice @chunks, 0, 2;
        $map->{$name} = [split /\n+/, $data];
    }

    return $map;
}

1;
