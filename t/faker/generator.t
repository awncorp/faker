use Test::More;
use Faker::Generator;

my $gen = Faker::Generator->new;
ok $gen, 'generator instantiated';
can_ok $gen, 'find_formatter';
can_ok $gen, 'format';
can_ok $gen, 'formatters';
can_ok $gen, 'parse';
can_ok $gen, 'providers';
can_ok $gen, 'register_provider';
can_ok $gen, 'seed';

done_testing;
