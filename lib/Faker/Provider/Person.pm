# ABSTRACT: Faker Standard Person Provider
package Faker::Provider::Person;

use Faker::Base;

extends 'Faker::Provider';

# VERSION

method name () {
    return $self->process_random('format_for_name');
}

method first_name () {
    return $self->process_random('data_for_first_name');
}

method last_name () {
    return $self->process_random('data_for_last_name');
}

method username () {
    return $self->process_markers(
        $self->process_random('format_for_username')
    );
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;
    use Faker::Provider::Person;

    my $faker = Faker->new;
    my $person = Faker::Provider::Person->new(factory => $faker);

    say $person->name;

=head1 DESCRIPTION

Faker::Provider::Person is a L<Faker> provider which provides fake data for a
person. B<Note: This is an early release available for testing and feedback and
as such is subject to change.>

=method name

    $person->name;

    # John Doe
    # Jane Doe

The name method generates a random ficticious name for a person.

=method first_name

    $person->first_name;

    # John
    # Jane

The first_name method generates a random ficticious first name for a person.

=method last_name

    $person->last_name;

    # Doe
    # Smith

The last_name method generates a random ficticious last name for a person.

=method username

    $person->username;

    # gDoe
    # John.Doe
    # Doe.John

The username method generates a random ficticious username.

=cut
