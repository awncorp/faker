use Test::More;
use Faker::Exception;

my $exc = Faker::Exception->new;
ok $exc, 'exception instantiated';

eval { Faker::Exception->throw('this is bad') };
ok $@, 'exception has been thrown';
ok +Faker::Exception->caught($@), 'exception owner identified';
is $@->message, 'this is bad', 'exception message retrieved';

done_testing;
