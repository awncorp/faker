package Faker::Generator::Null;

use Bubblegum::Class;

sub AUTOLOAD {
    return undef;
}

sub DESTROY {
    # noop
}

1;
