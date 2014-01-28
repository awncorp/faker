package Faker::Generator::Null;

use 5.14.0;
use feature 'unicode_strings';
use Moo;
use Function::Parameters;

method AUTOLOAD {
    return undef;
}

1;
