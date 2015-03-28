use Test::More;

use_ok 'Faker';
use_ok 'Faker::Provider::Address';

my $faker    = Faker->new;
my $provider = Faker::Provider::Address->new(factory => $faker);

ok $provider->does($_) for qw(
    Faker::Role::Data
    Faker::Role::Format
    Faker::Role::Process
    Faker::Role::Random
);

ok $provider->city_name, 'city_name method ok' for 1..50;
ok $provider->city_suffix, 'city_suffix method ok' for 1..50;
ok $provider->latitude, 'latitude method ok' for 1..50;
ok $provider->line1, 'line1 method ok' for 1..50;
ok $provider->lines, 'lines method ok' for 1..50;
ok $provider->longitude, 'longitude method ok' for 1..50;
ok $provider->number, 'number method ok' for 1..50;
ok $provider->postal_code, 'postal_code method ok' for 1..50;
ok $provider->street_name, 'street_name method ok' for 1..50;
ok $provider->street_suffix, 'street_suffix method ok' for 1..50;

ok 1 and done_testing;
