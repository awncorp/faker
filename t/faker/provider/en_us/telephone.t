use Test::More;

use_ok 'Faker';
use_ok 'Faker::Provider::en_US::Telephone';

my $faker    = Faker->new;
my $provider = Faker::Provider::en_US::Telephone->new(factory => $faker);

ok $provider->does($_) for qw(
    Faker::Role::Data
    Faker::Role::Format
    Faker::Role::Process
    Faker::Role::Random
);

ok $provider->number, 'number method ok' for 1..50;

ok 1 and done_testing;
