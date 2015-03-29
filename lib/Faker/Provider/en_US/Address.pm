# ABSTRACT: Faker Localized en_US Address Provider
package Faker::Provider::en_US::Address;

use Faker::Base;

extends 'Faker::Provider::Address';

# VERSION

method city_prefix () {
    return $self->process(random => 'city_prefix');
}

method country_name () {
    return $self->process(random => 'country_name');
}

method line2 () {
    return $self->process(random => 'line2', number_markers => 1,
            line_markers => 1);
}

method state_abbr () {
    return $self->process(random => 'state_abbr', line_markers => 1);
}

method state_name () {
    return $self->process(random => 'state_name', line_markers => 1);
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;
    use Faker::Provider::en_US::Address;

    my $faker = Faker->new(locale => 'en_US');
    my $address = Faker::Provider::en_US::Address->new(factory => $faker);

    say $address->lines;

=head1 DESCRIPTION

Faker::Provider::en_US::Address is a L<Faker> provider localized under en_US,
which provides fake address data. Faker::Provider::en_US::Address inherits all
attributes and methods from L<Faker::Provider::Address> and implements the
following new ones. B<Note: This is an early release available for testing and
feedback and as such is subject to change.>

=method city_prefix

    $address->city_prefix;

    # West
    # South
    # South

The city_prefix method generates a random city prefix, common in the en_US
locale.

=method country_name

    $address->country_name;

    # Tonga
    # Norfolk Island
    # Nicaragua

The country_name method generates a random country name.

=method line2

    $address->line2

    # Suite 709
    # Suite 621
    # Suite 907

The line2 method generates a random address string containing a common secondary
address designation, common in the en_US locale.

=method state_abbr

    $address->state_abbr;

    # WV
    # ND
    # CT

The state_abbr method generates a random abbreviated state string, common in the
en_US locale.

=method state_name

    $address->state_name;

    # Alaska
    # Washington
    # Maryland

The state_name method generates a random state string, common in the en_US
locale.

=cut
