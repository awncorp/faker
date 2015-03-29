# ABSTRACT: Faker Standard Telephone Number Provider
package Faker::Provider::Telephone;

use Faker::Base;

extends 'Faker::Provider';

# VERSION

method number () {
    return $self->process(random => 'number', all_markers => 1);
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;
    use Faker::Provider::PhoneNumber;

    my $faker = Faker->new;
    my $phone = Faker::Provider::Telephone->new(factory => $faker);

    say $phone->number;

=head1 DESCRIPTION

Faker::Provider::Telephone is a L<Faker> provider which provides fake phone data.
B<Note: This is an early release available for testing and feedback and as such
is subject to change.>

=method number

    $phone->number;

    # (882) 119-2218
    # (131) 225-5649
    # 378 916 6044

The number method generates a random ficticious telephone number.

=cut
