use Test::More;

use_ok 'Faker';
use_ok 'Faker::Provider::en_US::Company';

my $faker    = Faker->new;
my $provider = Faker::Provider::en_US::Company->new(factory => $faker);

ok $provider->does($_) for qw(
    Faker::Role::Data
    Faker::Role::Format
    Faker::Role::Process
    Faker::Role::Random
);

ok $provider->buzzword_type1, 'buzzword_type1 method ok' for 1..50;
ok $provider->buzzword_type2, 'buzzword_type2 method ok' for 1..50;
ok $provider->buzzword_type3, 'buzzword_type3 method ok' for 1..50;
ok $provider->description, 'description method ok' for 1..50;
ok $provider->jargon_buzz_word, 'jargon_buzz_word method ok' for 1..50;
ok $provider->jargon_edge_word, 'jargon_edge_word method ok' for 1..50;
ok $provider->jargon_prop_word, 'jargon_prop_word method ok' for 1..50;
ok $provider->name, 'name method ok' for 1..50;
ok $provider->name_suffix, 'name_suffix method ok' for 1..50;
ok $provider->tagline, 'tagline method ok' for 1..50;

ok 1 and done_testing;
