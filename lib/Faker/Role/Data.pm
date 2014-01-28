package Faker::Role::Data;

use 5.14.0;
use feature 'unicode_strings';
use Moo::Role;
use Function::Parameters;
use Hash::Merge::Simple qw(merge);
use Types::Standard qw(HashRef);

has data => (
    is       => 'ro',
    isa      => HashRef,
    lazy     => 1,
    builder  => 1
);

method _build_data {
    my $class   = ref $self;
    my @parents = do { no strict 'refs'; @{"${class}::ISA"} };
    my @data    = {};

    for my $class ($class, @parents) {
        push @data, $self->get_token_data($class);
    }

    return merge reverse @data;
}

method get_token_data ($class) {
    $class //= ref $self;

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
