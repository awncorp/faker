use Test::More;

use_ok 'Faker';
use_ok 'Faker::Provider::Company';

my $faker    = Faker->new;
my $provider = Faker::Provider::Company->new(factory => $faker);

ok $provider->does($_) for qw(
    Faker::Role::Data
    Faker::Role::Format
    Faker::Role::Process
    Faker::Role::Random
);

ok $provider->name, 'name method ok' for 1..50;
ok $provider->name_suffix, 'name_suffix method ok' for 1..50;

ok 1 and done_testing;
