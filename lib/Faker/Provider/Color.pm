# ABSTRACT: Faker Standard Color Provider
package Faker::Provider::Color;

use Faker::Base;

extends 'Faker::Provider';

# VERSION

method name () {
    return $self->process(random => 'name');
}

method hex_code () {
    my $number = $self->random_between(1, 16777215);
    return '#' . sprintf('%06s', sprintf('%02x', $number));
}

method rgbcolors () {
    return join ',', @{$self->rgbcolors_array};
}

method rgbcolors_array () {
    my $color = $self->hex_code;
    return [
        hex(substr($color, 1, 2)),
        hex(substr($color, 3, 2)),
        hex(substr($color, 5, 2)),
    ]
}

method rgbcolors_css () {
    return sprintf 'rgb(%s)', $self->rgbcolors;
}

method safe_name () {
    return $self->process(random => 'safe_name');
}

method safe_hex_code () {
    my $number = $self->random_between(0, 255);
    return '#' . sprintf("ff00%02x", $number);
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;
    use Faker::Provider::Color;

    my $faker = Faker->new;
    my $color = Faker::Provider::Color->new(factory => $faker);

    say $color->name;

=head1 DESCRIPTION

Faker::Provider::Color is a L<Faker> provider which provides fake color data.
B<Note: This is an early release available for testing and feedback and as such
is subject to change.>

=method hex_code

    $color->hex_code;

    # #1d648c
    # #9f6ad3
    # #60a5ad

The hex_code method generates a random ficticious hex color.

=method name

    $color->name;

    # IndianRed
    # Chartreuse
    # Navy

The name method generates a random ficticious color name.

=method rgbcolors

    $color->rgbcolors;

    # 107,172,5
    # 237,189,50
    # 44,239,160

The rgbcolors method generates a random ficticious rgb colors.

=method rgbcolors_array

    $color->rgbcolors_array;

    # [ 107,172,56 ]
    # [ 237,189,50 ]
    # [ 44,239,160 ]

The rgbcolors_array method generates a random ficticious rgb colors.

=method rgbcolors_css

    $color->rgbcolors_css;

    # rgb(219,144,55)
    # rgb(171,64,67)
    # rgb(25,20,204)

The rgbcolors_css method generates a random ficticious rgbcolors for css.

=method safe_hex_code

    $color->safe_hex_code;

    # #ff009e
    # #ff0004
    # #ff0072

The safe_hex_code method generates a random ficticious safe hex color.

=method safe_name

    $color->safe_name;

    # navy
    # fuchsia
    # aqua

The safe_name method generates a random ficticious safe color name.

=cut
