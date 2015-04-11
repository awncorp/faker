# ABSTRACT: Faker Standard Payment Details Provider
package Faker::Provider::Payment;

use Faker::Base;

extends 'Faker::Provider';

# VERSION

method card_expiration () {
    my $pad   = $self->random_between(1,3);
    my $month = sprintf('%02d', $self->random_between(1,12));
    my $year  = sprintf('%02d', ((localtime)[5] % 100) + $pad);
    return "$month/$year";
}

method card_number (STRING $vendor = '') {
    my $vendor_mapping = {
        'Visa'             => 'visa',
        'MasterCard'       => 'mastercard',
        'American Express' => 'americanexpress',
        'Discover Card'    => 'discovercard',
    };
    $vendor = $vendor_mapping->{$vendor};
    $vendor = $self->random_array_item([values %$vendor_mapping]) if !$vendor;
    return $self->process(random => "${vendor}_card", all_markers => 1);
}

method vendor () {
    return $self->process(random => 'vendor', all_markers => 1);
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;
    use Faker::Provider::Payment;

    my $faker   = Faker->new;
    my $payment = Faker::Provider::Payment->new(factory => $faker);

    say $payment->number;

=head1 DESCRIPTION

Faker::Provider::Payment is a L<Faker> provider which provides fake payment
data, e.g. credit card information, bank information, etc. B<Note: This is an
early release available for testing and feedback and as such is subject to
change.>


=method card_expiration

    $payment->card_expiration;

    # 09/16
    # 11/16
    # 05/17

The card_expiration method generates a random ficticious credit card expiration
date.

=method card_number

    $payment->card_number;

    # 547099615390835
    # 448549861731791
    # 37848826954012

The card_number method generates a random ficticious credit card number.

=method vendor

    $payment->vendor;

    # Visa
    # MasterCard
    # American Express

The vendor method generates a random ficticious credit card vendor.

=cut
