use Test::More;

use_ok 'Faker';
use_ok 'Faker::Provider::Internet';

my $faker    = Faker->new;
my $provider = Faker::Provider::Internet->new(factory => $faker);

ok $provider->does($_) for qw(
    Faker::Role::Data
    Faker::Role::Format
    Faker::Role::Process
    Faker::Role::Random
);

ok $provider->domain_name, 'domain_name method ok' for 1..50;
ok $provider->domain_word, 'domain_word method ok' for 1..50;
ok $provider->email_address, 'email_address method ok' for 1..50;
ok $provider->email_domain, 'email_domain method ok' for 1..50;
ok $provider->ip_address, 'ip_address method ok' for 1..50;
ok $provider->ip_address_v4, 'ip_address_v4 method ok' for 1..50;
ok $provider->ip_address_v6, 'ip_address_v6 method ok' for 1..50;
ok $provider->root_domain, 'root_domain method ok' for 1..50;
ok $provider->url, 'url method ok' for 1..50;

ok 1 and done_testing;
