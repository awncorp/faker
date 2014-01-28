use Test::More;
use Faker;
use feature 'say';

my $fake = maker Faker;

ok $fake,     '$fake set via shortcut';
isa_ok $fake, 'Faker::Generator', '$fake is a generator';

done_testing;
