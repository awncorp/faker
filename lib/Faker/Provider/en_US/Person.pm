# ABSTRACT: Faker Localized en_US Person Provider
package Faker::Provider::en_US::Person;

use Faker::Base;

extends 'Faker::Provider::Person';

# VERSION

method name_prefix () {
    return $self->process_random('data_for_name_prefix');
}

method name_suffix () {
    return $self->process_random('data_for_name_suffix');
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;
    use Faker::Provider::en_US::Person;

    my $faker = Faker->new(locale => 'en_US');
    my $person = Faker::Provider::en_US::Person->new(factory => $faker);

    say $person->name;

=head1 DESCRIPTION

Faker::Provider::en_US::Person is a L<Faker> provider localized under en_US,
which provides fake data for a person. Faker::Provider::en_US::Person inherits
all attributes and methods from L<Faker::Provider::Person> and implements the
following new ones. B<Note: This is an early release available for testing and
feedback and as such is subject to change.>

=method name_prefix

    $address->name_prefix;

    # Dr.
    # Miss
    # Dr.

The name_prefix method generates a random name prefix for a person, common in
the en_US locale.

=method name_suffix

    $address->name_suffix;

    # IV
    # PhD
    # I

The name_suffix method generates a random name suffix for a person, common in
the en_US locale.

=cut
