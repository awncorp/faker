# ABSTRACT: Extensible Fake Data Generator
package Faker;

use Bubblegum::Class;
use Faker::Failure;

use Bubblegum::Constraints -typesof;
use Class::Load 'try_load_class';

# VERSION

has locale => (
    is      => 'ro',
    isa     => typeof_string,
    default => 'en_US'
);

has namespace => (
    is      => 'ro',
    isa     => typeof_string,
    default => 'Faker::Provider'
);

has providers => (
    is       => 'ro',
    isa      => typeof_hashref,
    default  => sub {{}}
);

sub provider {
    my $self = shift;
    my $provider = shift;

    $provider->asa_string;

    my $namespace = $self->namespace;
    my $locale    = $self->locale;
    my $classes   = [];

    my $provider_key = join '/', grep defined, (
        $namespace, $locale, $provider
    );

    if (my $existing = $self->providers->get($provider_key)) {
        return $existing;
    }

    push @$classes, join '::', $namespace, $locale, $provider;
    push @$classes, join '::', $namespace, $provider;

    # fallback spaces
    push @$classes, join '::', 'Faker::Provider', $locale, $provider;
    push @$classes, join '::', 'Faker::Provider', 'en_US', $provider;
    push @$classes, join '::', 'Faker::Provider', $provider;

    # filter out duplicates
    $classes = $classes->unique;

    for my $class (@$classes) {
        if (try_load_class $class) {
            my $provider_object = $class->new(factory => $self);
            $self->providers->set($provider_key => $provider_object);
            return $provider_object;
        }
    }

    my $failure;
    $failure = 'Unable to find provider "%s", locale "%s", using (%s)';
    $failure = sprintf $failure, $provider, $locale, $classes->join(', ');
    Faker::Failure->throw(message => $failure);
}

1;

__END__

=head1 SYNPOSIS

    use Faker;

    my $faker = Faker->new(locale => 'en_US');
    my $address = $faker->provider('Address');

    my $address_line1 = $address->line1;
    my $address_line2 = $address->line2;
    my $address_city  = $address->city_name;
    my $address_state = $address->state_abbr;
    my $address_zip   = $address->postal_code;

    say $address_line1;
    say $address_line2;
    say "$address_city, $address_state $address_zip";

    my $latitude  = $address->latitude;
    my $longitude = $address->longitude;

    say "$longitude, $latitude";

    my $person = $faker->provider('Person');

    say $person->name; # Adaline Reichel
    say $person->name; # Dr. Santa Prosacco DVM
    say $person->name; # Noemy Vandervort V
    say $person->name; # Lexi O'Conner
    say $person->name; # Gracie Weber
    say $person->name; # Roscoe Johns
    say $person->name; # Emmett Lebsack
    say $person->name; # Keegan Thiel
    say $person->name; # Wellington Koelpin II
    say $person->name; # Ms. Karley Kiehn V

=head1 DESCRIPTION

Faker is a Perl library that generates fake data for you. Whether you need to
bootstrap your database, create good-looking XML documents, fill-in your
persistence to stress test it, or anonymize data taken from a production
service, Faker makes it easy to generate fake data with some semantics. B<Note:
This is an early release available for testing and feedback and as such is
subject to change.>

=cut
