package Faker::Role;

use Extorter;

# VERSION

sub import {
    my $class  = shift;
    my $target = caller;

    $class->extort::into($target, '*Data::Object::Role');
    $class->extort::into($target, '*Faker::Signature');
    $class->extort::into($target, '*Faker::Type');

    return;
}

1;
