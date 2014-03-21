package Faker::Role::Provider;

use Bubblegum::Role;
use Faker::Generator::Null;
use Faker::Generator::Unique;

use Bubblegum::Constraints -minimal;

with 'Faker::Role::Utility';

has generator => (
    is       => 'ro',
    isa      => _obj,
    required => 1
);

has unique_generator => (
    is       => 'ro',
    isa      => _obj,
    lazy     => 1,
    builder  => 1
);

sub _build_unique_generator {
    return Faker::Generator::Unique->new(
        generator => shift->generator
    );
}

sub guesser {
    my $self   = _obj shift;
    my $format = _str shift;

    return 'boolean' if $format =~ /^is_/;
}

sub optional {
    my $self   = _obj shift;
    my $weight = _num shift // 0.5;
    return $self->generator if rand(100) <= $weight * 100;
    return Faker::Generator::Null->new;
}

sub unique {
    my $self    = _obj shift;
    my $reset   = _num shift // 0;
    my $retries = _num shift // 10000;
    return $self->unique_generator if !$reset;

    my $ugen = Faker::Generator::Unique->new(max_retries => $retries);
    return $self->unique_generator($ugen);
}

1;
