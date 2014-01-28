use Test::More;
use Faker::Generator;
use Faker::Generator::Unique;

my $gen = Faker::Generator::Unique->new(generator => Faker::Generator->new);
ok $gen, 'generator instantiated';
can_ok $gen, 'generator';
can_ok $gen, 'max_retries';

done_testing;
