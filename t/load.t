use Test::More;

# core
use_ok 'Faker';

# providers
use_ok 'Faker::Provider::Address';
use_ok 'Faker::Provider::Company';
use_ok 'Faker::Provider::Person';
use_ok 'Faker::Provider::PhoneNumber';

# en_US providers
use_ok 'Faker::Provider::en_US::Address';
use_ok 'Faker::Provider::en_US::Company';
use_ok 'Faker::Provider::en_US::Person';
use_ok 'Faker::Provider::en_US::PhoneNumber';

done_testing;
