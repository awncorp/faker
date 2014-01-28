use Test::More;
use Faker::Generator::Null;

my $gen = Faker::Generator::Null->new;
ok $gen, 'generator instantiated';

done_testing;
