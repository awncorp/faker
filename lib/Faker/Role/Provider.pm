package Faker::Role::Provider;

use Bubblegum::Role;
use Faker::Generator::Null;
use Faker::Generator::Unique;

use Bubblegum::Syntax -types, -typesof;

with 'Faker::Role::Utility';

has generator => (
    is       => 'ro',
    isa      => typeof_obj,
    required => 1
);

has unique_generator => (
    is       => 'ro',
    isa      => typeof_obj,
    lazy     => 1,
    builder  => 1
);

sub _build_unique_generator {
    return Faker::Generator::Unique->new(
        generator => shift->generator
    );
}

sub guesser {
    my $self   = type_obj shift;
    my $format = type_str shift;

    return 'boolean' if $format =~ /^is_/;
}

sub optional {
    my $self   = type_obj shift;
    my $weight = type_num shift // 0.5;
    return $self->generator if rand(100) <= $weight * 100;
    return Faker::Generator::Null->new;
}

sub unique {
    my $self    = type_obj shift;
    my $reset   = type_num shift // 0;
    my $retries = type_num shift // 10000;
    return $self->unique_generator if !$reset;

    my $ugen = Faker::Generator::Unique->new(max_retries => $retries);
    return $self->unique_generator($ugen);
}

1;
