use Test::More;
use Faker::Generator;

my $gen = Faker::Generator->new;
ok $gen, 'generator instantiated';
can_ok $gen, 'formatters';
can_ok $gen, 'providers';
can_ok $gen, 'add_provider';
can_ok $gen, 'format';
can_ok $gen, 'get_formater';
can_ok $gen, 'get_providers';
can_ok $gen, 'parse';
can_ok $gen, 'seed';

done_testing;
