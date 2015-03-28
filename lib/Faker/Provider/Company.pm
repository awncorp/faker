# ABSTRACT: Faker Standard Company Provider
package Faker::Provider::Company;

use Faker::Base;

extends 'Faker::Provider';

# VERSION

method name () {
    return $self->process_random('format_for_name');
}

method name_suffix () {
    return $self->process_random('data_for_name_suffix');
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;
    use Faker::Provider::Company;

    my $faker = Faker->new;
    my $company = Faker::Provider::Company->new(factory => $faker);

    say $company->name;

=head1 DESCRIPTION

Faker::Provider::Company is a L<Faker> provider which provides fake company
data. B<Note: This is an early release available for testing and feedback and as
such is subject to change.>

=method name

    $company->name;

    # Padberg Co.
    # Russel Ltd.
    # Murazik Co.

The name method generates a random ficticious company name.

=method name_suffix

    $company->name_suffix;

    # Ltd.
    # Inc.
    # Co.

The name_suffix method generates a random ficticious company name suffix.

=cut
