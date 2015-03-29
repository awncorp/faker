# ABSTRACT: Faker Localized en_US Telephone Provider
package Faker::Provider::en_US::Telephone;

use Faker::Base;

extends 'Faker::Provider::Telephone';

# VERSION

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;
    use Faker::Provider::en_US::Telephone;

    my $faker = Faker->new(locale => 'en_US');
    my $phone = Faker::Provider::en_US::Telephone->new(factory => $faker);

    say $phone->number;

=head1 DESCRIPTION

Faker::Provider::en_US::Telephone is a L<Faker> provider localized under
en_US, which provides fake phone data. Faker::Provider::en_US::Telephone
inherits all attributes and methods from L<Faker::Provider::Telephone> and
implements the following new ones. B<Note: This is an early release available
for testing and feedback and as such is subject to change.>

=method number

    $phone->number;

    # 01926981135
    # 02316835769
    # 019-494-2138
    # 1-423-443-5891
    # 747-776-7241x90468
    # 403.744.6597x765

The number method generates a random ficticious telephone number.

=cut
