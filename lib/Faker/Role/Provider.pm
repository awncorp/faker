package Faker::Role::Provider;

use 5.14.0;
use feature 'unicode_strings';
use Faker::Generator::Null;
use Faker::Generator::Unique;
use Moo::Role;
use Function::Parameters;
use Types::Standard qw(InstanceOf);

with 'Faker::Role::Utility';

has generator => (
    is       => 'ro',
    isa      => InstanceOf['Faker::Generator'],
    required => 1
);

has unique_generator => (
    is       => 'ro',
    isa      => InstanceOf['Faker::Generator::Unique'],
    lazy     => 1,
    builder  => 1
);

method _build_unique_generator {
    return Faker::Generator::Unique->new(generator => $self->generator);
}

method guesser ($format) {
    given ($format) {
        when (/^is_/) {
            return 'boolean';
        }
    }
}

method optional ($weight=0.5) {
    return $self->generator if rand(100) <= $weight * 100;
    return Faker::Generator::Null->new;
}

method unique ($reset=0, $retries=10000) {
    return $self->unique_generator if !$reset;

    my $ugen = Faker::Generator::Unique->new(max_retries => $retries);
    return $self->unique_generator($ugen);
}

1;
