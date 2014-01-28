use Test::More;

# core
use_ok 'Faker';
use_ok 'Faker::Exception';
use_ok 'Faker::Factory';
use_ok 'Faker::Generator';

# providers
use_ok 'Faker::Provider::Address';
use_ok 'Faker::Provider::Color';
use_ok 'Faker::Provider::Company';
use_ok 'Faker::Provider::DateTime';
use_ok 'Faker::Provider::File';
use_ok 'Faker::Provider::Internet';
use_ok 'Faker::Provider::Lorem';
use_ok 'Faker::Provider::Miscellaneous';
use_ok 'Faker::Provider::Person';
use_ok 'Faker::Provider::PhoneNumber';
use_ok 'Faker::Provider::UserAgent';

# en_US providers
use_ok 'Faker::Provider::en_US::Person';

done_testing;
