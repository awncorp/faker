use Test::More;
use Faker::Factory;

my $fact = Faker::Factory->new;
ok $fact, 'factory instantiated';
can_ok $fact, 'locale';
can_ok $fact, 'providers';
can_ok $fact, 'create';
can_ok $fact, 'get_provider_class';
can_ok $fact, 'find_provider_class';

my $providers = [qw(
    Faker::Provider::Address
    Faker::Provider::Color
    Faker::Provider::Company
    Faker::Provider::DateTime
    Faker::Provider::File
    Faker::Provider::Internet
    Faker::Provider::Lorem
    Faker::Provider::Miscellaneous
    Faker::Provider::Person
    Faker::Provider::PhoneNumber
    Faker::Provider::UserAgent
)];

is $fact->locale, 'en_US', 'factory locale default ok';
is_deeply $fact->providers, $providers, 'factory providers default ok';

done_testing;
