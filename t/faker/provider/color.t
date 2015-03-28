use Test::More;

use_ok 'Faker';
use_ok 'Faker::Provider::Color';

my $faker    = Faker->new;
my $provider = Faker::Provider::Color->new(factory => $faker);

ok $provider->does($_) for qw(
    Faker::Role::Data
    Faker::Role::Format
    Faker::Role::Process
    Faker::Role::Random
);

ok $provider->hex_code, 'hex_code method ok' for 1..50;
ok $provider->name, 'name method ok' for 1..50;
ok $provider->rgbcolors, 'rgbcolors method ok' for 1..50;
ok $provider->rgbcolors_array, 'rgbcolors_array method ok' for 1..50;
ok $provider->rgbcolors_css, 'rgbcolors_css method ok' for 1..50;
ok $provider->safe_hex_code, 'safe_hex_code method ok' for 1..50;
ok $provider->safe_name, 'safe_name method ok' for 1..50;

ok 1 and done_testing;
