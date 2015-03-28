package Faker::Function;

use Extorter;

# VERSION

my %functions = (
    confess   => 'Carp::confess',
    merge     => 'Hash::Merge::Simple::merge',
    load      => 'Class::Load::load',
    tryload   => 'Class::Load::try_load_class',
);

sub import {
    my $class  = shift;
    my $target = caller;

    my @parameters = map "$functions{$_}=$_",
        grep $functions{$_}, @_ if @_;

    $class->extort::into($target, $_) for @parameters;
    $class->extort::into($target, '*namespace::autoclean');

    return;
}

1;
