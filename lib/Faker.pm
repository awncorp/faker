# ABSTRACT: Extensible Fake Data Generator
package Faker;

use Faker::Base;
use Faker::Function qw(confess tryload);

# VERSION

has locale => (
    is      => 'ro',
    isa     => STRING,
    default => 'en_US',
);

has namespace => (
    is      => 'ro',
    isa     => STRING,
    default => 'Faker::Provider',
);

method provider (STRING $name) {
    my $namespace = $self->namespace;
    my $locale    = $self->locale;
    my $default   = 'en_US';

    my @classes;
    my $explicit  = $locale && $locale ne $default;

    push @classes, join '::', $namespace, $locale, $name if $explicit;
    push @classes, join '::', $namespace, $default, $name;
    push @classes, join '::', $namespace, $name;

    for my $class (@classes) {
        return $class->new(factory => $self) if tryload $class;
    }

    my $classes = join ' or ', @classes;
    confess "Unable to locate or load provider $classes";
}

method address_city_name (@args) {
    $self->provider('Address')->city_name(@args);
}

method address_city_prefix (@args) {
    $self->provider('Address')->city_prefix(@args);
}

method address_city_suffix (@args) {
    $self->provider('Address')->city_suffix(@args);
}

method address_country_name (@args) {
    $self->provider('Address')->country_name(@args);
}

method address_latitude (@args) {
    $self->provider('Address')->latitude(@args);
}

method address_line1 (@args) {
    $self->provider('Address')->line1(@args);
}

method address_line2 (@args) {
    $self->provider('Address')->line2(@args);
}

method address_lines (@args) {
    $self->provider('Address')->lines(@args);
}

method address_longitude (@args) {
    $self->provider('Address')->longitude(@args);
}

method address_number (@args) {
    $self->provider('Address')->number(@args);
}

method address_postal_code (@args) {
    $self->provider('Address')->postal_code(@args);
}

method address_state_abbr (@args) {
    $self->provider('Address')->state_abbr(@args);
}

method address_state_name (@args) {
    $self->provider('Address')->state_name(@args);
}

method address_street_name (@args) {
    $self->provider('Address')->street_name(@args);
}

method address_street_suffix (@args) {
    $self->provider('Address')->street_suffix(@args);
}

method color_hex_code (@args) {
    $self->provider('Color')->hex_code(@args);
}

method color_name (@args) {
    $self->provider('Color')->name(@args);
}

method color_rgbcolors (@args) {
    $self->provider('Color')->rgbcolors(@args);
}

method color_rgbcolors_array (@args) {
    $self->provider('Color')->rgbcolors_array(@args);
}

method color_rgbcolors_css (@args) {
    $self->provider('Color')->rgbcolors_css(@args);
}

method color_safe_hex_code (@args) {
    $self->provider('Color')->safe_hex_code(@args);
}

method color_safe_name (@args) {
    $self->provider('Color')->safe_name(@args);
}

method company_buzzword_type1 (@args) {
    $self->provider('Company')->buzzword_type1(@args);
}

method company_buzzword_type2 (@args) {
    $self->provider('Company')->buzzword_type2(@args);
}

method company_buzzword_type3 (@args) {
    $self->provider('Company')->buzzword_type3(@args);
}

method company_description (@args) {
    $self->provider('Company')->description(@args);
}

method company_jargon_buzz_word (@args) {
    $self->provider('Company')->jargon_buzz_word(@args);
}

method company_jargon_edge_word (@args) {
    $self->provider('Company')->jargon_edge_word(@args);
}

method company_jargon_prop_word (@args) {
    $self->provider('Company')->jargon_prop_word(@args);
}

method company_name (@args) {
    $self->provider('Company')->name(@args);
}

method company_name_suffix (@args) {
    $self->provider('Company')->name_suffix(@args);
}

method company_tagline (@args) {
    $self->provider('Company')->tagline(@args);
}

method internet_domain_name (@args) {
    $self->provider('Internet')->domain_name(@args);
}

method internet_domain_word (@args) {
    $self->provider('Internet')->domain_word(@args);
}

method internet_email_address (@args) {
    $self->provider('Internet')->email_address(@args);
}

method internet_email_domain (@args) {
    $self->provider('Internet')->email_domain(@args);
}

method internet_ip_address (@args) {
    $self->provider('Internet')->ip_address(@args);
}

method internet_ip_address_v4 (@args) {
    $self->provider('Internet')->ip_address_v4(@args);
}

method internet_ip_address_v6 (@args) {
    $self->provider('Internet')->ip_address_v6(@args);
}

method internet_root_domain (@args) {
    $self->provider('Internet')->root_domain(@args);
}

method internet_url (@args) {
    $self->provider('Internet')->url(@args);
}

method lorem_paragraph (@args) {
    $self->provider('Lorem')->paragraph(@args);
}

method lorem_paragraphs (@args) {
    $self->provider('Lorem')->paragraphs(@args);
}

method lorem_sentence (@args) {
    $self->provider('Lorem')->sentence(@args);
}

method lorem_sentences (@args) {
    $self->provider('Lorem')->sentences(@args);
}

method lorem_word (@args) {
    $self->provider('Lorem')->word(@args);
}

method lorem_words (@args) {
    $self->provider('Lorem')->words(@args);
}

method person_first_name (@args) {
    $self->provider('Person')->first_name(@args);
}

method person_last_name (@args) {
    $self->provider('Person')->last_name(@args);
}

method person_name (@args) {
    $self->provider('Person')->name(@args);
}

method person_name_prefix (@args) {
    $self->provider('Person')->name_prefix(@args);
}

method person_name_suffix (@args) {
    $self->provider('Person')->name_suffix(@args);
}

method person_username (@args) {
    $self->provider('Person')->username(@args);
}

method telephone_number (@args) {
    $self->provider('Telephone')->number(@args);
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Faker;

    my $faker = Faker->new;

    my $company  = $faker->provider('Company');
    my $address  = $faker->provider('Address');

    say $company->name;
    say $address->lines;

    # or

    say $faker->company_name;
    say $faker->address_lines;

=head1 DESCRIPTION

Faker is a Perl library that generates fake data for you. Whether you need to
bootstrap your database, create good-looking XML documents, fill-in your
persistence to stress test it, or anonymize data taken from a production
service, Faker makes it easy to generate fake data. B<Note: This is an early
release available for testing and feedback and as such is subject to change.>

=cut

=attribute namespace

    $faker->namespace('MyApp::FakeData');

The namespace attribute contains the namespace from which providers will be
loaded. This attribute defaults to Faker::Provider.

=cut

=attribute locale

    $faker->locale('en_US');

The locale attribute contains the locale string which is concatenated with the
namespace attribute to load fake data which is locale-specific.

=cut

=method provider

    $faker->provider('Company'); # Faker::Provider::en_US::Company

The provider method uses the namespace and locale attributes to load a
particular provider which provides methods to generate fake data.

=cut


=method address_city_name

    $faker->address_city_name; # Kirkville

The address_city_name method generates a random ficticious city name. This
method is a proxy method which is the equivalent of calling the C<city_name>
method on the L<Faker::Provider::Address> class.

=method address_city_prefix

    $faker->address_city_prefix; # West

The address_city_prefix method generates a random ficticious city prefix. This
method is a proxy method which is the equivalent of calling the C<city_prefix>
method on the L<Faker::Provider::en_US::Address> class.

=method address_city_suffix

    $faker->address_city_suffix; # ville

The address_city_suffix method generates a random ficticious city suffix. This
method is a proxy method which is the equivalent of calling the C<city_suffix>
method on the L<Faker::Provider::Address> class.

=method address_country_name

    $faker->address_country_name; # France

The address_country_name method generates a random ficticious country name.
This method is a proxy method which is the equivalent of calling the
C<country_name> method on the L<Faker::Provider::en_US::Address> class.

=method address_latitude

    $faker->address_latitude; # 59.682733

The address_latitude method generates a random ficticious latitude point. This
method is a proxy method which is the equivalent of calling the C<latitude>
method on the L<Faker::Provider::Address> class.

=method address_line1

    $faker->address_line1; # 4765 Goodwin Street

The address_line1 method generates a random ficticious street address. This
method is a proxy method which is the equivalent of calling the C<line1> method
on the L<Faker::Provider::Address> class.

=method address_line2

    $faker->address_line2; # Apt. 835

The address_line2 method generates a random ficticious address line2. This
method is a proxy method which is the equivalent of calling the C<line2> method
on the L<Faker::Provider::en_US::Address> class.

=method address_lines

    $faker->address_lines; # 5111 McClure Avenue, Laneville, 29442

The address_lines method generates a random ficticious stree address. This
method is a proxy method which is the equivalent of calling the C<lines> method
on the L<Faker::Provider::Address> class.

=method address_longitude

    $faker->address_longitude; # 73.002746

The address_longitude method generates a random ficticious longitude point.
This method is a proxy method which is the equivalent of calling the
C<longitude> method on the L<Faker::Provider::Address> class.

=method address_number

    $faker->address_number; # 4568

The address_number method generates a random ficticious street number. This
method is a proxy method which is the equivalent of calling the C<number>
method on the L<Faker::Provider::Address> class.

=method address_postal_code

    $faker->address_postal_code; # 11083-9440

The address_postal_code method generates a random ficticious postal code. This
method is a proxy method which is the equivalent of calling the C<postal_code>
method on the L<Faker::Provider::Address> class.

=method address_state_abbr

    $faker->address_state_abbr; # AS

The address_state_abbr method generates a random ficticious state abbr. This
method is a proxy method which is the equivalent of calling the C<state_abbr>
method on the L<Faker::Provider::en_US::Address> class.

=method address_state_name

    $faker->address_state_name; # Illinois

The address_state_name method generates a random ficticious state name. This
method is a proxy method which is the equivalent of calling the C<state_name>
method on the L<Faker::Provider::en_US::Address> class.

=method address_street_name

    $faker->address_street_name; # Borer Street

The address_street_name method generates a random ficticious street name. This
method is a proxy method which is the equivalent of calling the C<street_name>
method on the L<Faker::Provider::Address> class.

=method address_street_suffix

    $faker->address_street_suffix; # Parkway

The address_street_suffix method generates a random ficticious street suffix.
This method is a proxy method which is the equivalent of calling the
C<street_suffix> method on the L<Faker::Provider::Address> class.

=method color_hex_code

    $faker->color_hex_code; # #af0573

The color_hex_code method generates a random ficticious hex color. This method
is a proxy method which is the equivalent of calling the C<hex_code> method on
the L<Faker::Provider::Color> class.

=method color_name

    $faker->color_name; # PeachPuff

The color_name method generates a random ficticious color name. This method is
a proxy method which is the equivalent of calling the C<name> method on the
L<Faker::Provider::Color> class.

=method color_rgbcolors

    $faker->color_rgbcolors; # 142,63,127

The color_rgbcolors method generates a random ficticious rgb colors. This
method is a proxy method which is the equivalent of calling the C<rgbcolors>
method on the L<Faker::Provider::Color> class.

=method color_rgbcolors_array

    $faker->color_rgbcolors_array; # ARRAY(0x24d8788)

The color_rgbcolors_array method generates a random ficticious rgb colors.
This method is a proxy method which is the equivalent of calling the
C<rgbcolors_array> method on the L<Faker::Provider::Color> class.

=method color_rgbcolors_css

    $faker->color_rgbcolors_css; # rgb(214,199,200)

The color_rgbcolors_css method generates a random ficticious rgbcolors for css.
This method is a proxy method which is the equivalent of calling the
C<rgbcolors_css> method on the L<Faker::Provider::Color> class.

=method color_safe_hex_code

    $faker->color_safe_hex_code; # #ff0097

The color_safe_hex_code method generates a random ficticious safe hex color.
This method is a proxy method which is the equivalent of calling the
C<safe_hex_code> method on the L<Faker::Provider::Color> class.

=method color_safe_name

    $faker->color_safe_name; # white

The color_safe_name method generates a random ficticious safe color name. This
method is a proxy method which is the equivalent of calling the C<safe_name>
method on the L<Faker::Provider::Color> class.

=method company_buzzword_type1

    $faker->company_buzzword_type1; # embrace

The company_buzzword_type1 method generates a random ficticious buzzword type1.
This method is a proxy method which is the equivalent of calling the
C<buzzword_type1> method on the L<Faker::Provider::en_US::Company> class.

=method company_buzzword_type2

    $faker->company_buzzword_type2; # frictionless

The company_buzzword_type2 method generates a random ficticious buzzword type2.
This method is a proxy method which is the equivalent of calling the
C<buzzword_type2> method on the L<Faker::Provider::en_US::Company> class.

=method company_buzzword_type3

    $faker->company_buzzword_type3; # channels

The company_buzzword_type3 method generates a random ficticious buzzword type3.
This method is a proxy method which is the equivalent of calling the
C<buzzword_type3> method on the L<Faker::Provider::en_US::Company> class.

=method company_description

    $faker->company_description; # Delivers high-level capability

The company_description method generates a random ficticious description. This
method is a proxy method which is the equivalent of calling the C<description>
method on the L<Faker::Provider::en_US::Company> class.

=method company_jargon_buzz_word

    $faker->company_jargon_buzz_word; # circuit

The company_jargon_buzz_word method generates a random ficticious jargon buzz
word. This method is a proxy method which is the equivalent of calling the
C<jargon_buzz_word> method on the L<Faker::Provider::en_US::Company> class.

=method company_jargon_edge_word

    $faker->company_jargon_edge_word; # Polarised

The company_jargon_edge_word method generates a random ficticious jargon edge
word. This method is a proxy method which is the equivalent of calling the
C<jargon_edge_word> method on the L<Faker::Provider::en_US::Company> class.

=method company_jargon_prop_word

    $faker->company_jargon_prop_word; # full-range

The company_jargon_prop_word method generates a random ficticious jargon
proposition word. This method is a proxy method which is the equivalent of
calling the C<jargon_prop_word> method on the
L<Faker::Provider::en_US::Company> class.

=method company_name

    $faker->company_name; # Kozey Ltd.

The company_name method generates a random ficticious company name. This method
is a proxy method which is the equivalent of calling the C<name> method on the
L<Faker::Provider::Company> class.

=method company_name_suffix

    $faker->company_name_suffix; # Co.

The company_name_suffix method generates a random ficticious company name
suffix. This method is a proxy method which is the equivalent of calling the
C<name_suffix> method on the L<Faker::Provider::Company> class.

=method company_tagline

    $faker->company_tagline; # infomediaries web-enabled brand

The company_tagline method generates a random ficticious tagline. This method
is a proxy method which is the equivalent of calling the C<tagline> method on
the L<Faker::Provider::en_US::Company> class.

=method internet_domain_name

    $faker->internet_domain_name; # crooks-swift-and-nolan.org

The internet_domain_name method generates a random ficticious domain name.
This method is a proxy method which is the equivalent of calling the
C<domain_name> method on the L<Faker::Provider::Internet> class.

=method internet_domain_word

    $faker->internet_domain_word; # orn-lesch-and-spencer

The internet_domain_word method generates a random ficticious domain word.
This method is a proxy method which is the equivalent of calling the
C<domain_word> method on the L<Faker::Provider::Internet> class.

=method internet_email_address

    $faker->internet_email_address; # maximo31@balistreri-pty.org

The internet_email_address method generates a random ficticious email address.
This method is a proxy method which is the equivalent of calling the
C<email_address> method on the L<Faker::Provider::Internet> class.

=method internet_email_domain

    $faker->internet_email_domain; # gmail.com

The internet_email_domain method generates a random ficticious email domain.
This method is a proxy method which is the equivalent of calling the
C<email_domain> method on the L<Faker::Provider::Internet> class.

=method internet_ip_address

    $faker->internet_ip_address; # 87.129.119.157

The internet_ip_address method generates a random ficticious ip address. This
method is a proxy method which is the equivalent of calling the C<ip_address>
method on the L<Faker::Provider::Internet> class.

=method internet_ip_address_v4

    $faker->internet_ip_address_v4; # 98.122.126.251

The internet_ip_address_v4 method generates a random ficticious ip address v4.
This method is a proxy method which is the equivalent of calling the
C<ip_address_v4> method on the L<Faker::Provider::Internet> class.

=method internet_ip_address_v6

    $faker->internet_ip_address_v6; # 8711:aa2d:654d:65b5:1079:ba06:bbac:d496

The internet_ip_address_v6 method generates a random ficticious ip address v6.
This method is a proxy method which is the equivalent of calling the
C<ip_address_v6> method on the L<Faker::Provider::Internet> class.

=method internet_root_domain

    $faker->internet_root_domain; # org

The internet_root_domain method generates a random ficticious root domain.
This method is a proxy method which is the equivalent of calling the
C<root_domain> method on the L<Faker::Provider::Internet> class.

=method internet_url

    $faker->internet_url; # https://www.medhurst-konopelski-and-prohaska.net/

The internet_url method generates a random ficticious url. This method is a
proxy method which is the equivalent of calling the C<url> method on the
L<Faker::Provider::Internet> class.

=method lorem_paragraph

    $faker->lorem_paragraph; # voluptatibus sit aut culpa et ....

The lorem_paragraph method generates a random ficticious paragraph. This method
is a proxy method which is the equivalent of calling the C<paragraph> method on
the L<Faker::Provider::Lorem> class.

=method lorem_paragraphs

    $faker->lorem_paragraphs; # assumenda voluptatibus ....

The lorem_paragraphs method generates a random ficticious paragraphs. This
method is a proxy method which is the equivalent of calling the C<paragraphs>
method on the L<Faker::Provider::Lorem> class.

=method lorem_sentence

    $faker->lorem_sentence; # consequatur doloremque assumenda optio rerum.

The lorem_sentence method generates a random ficticious sentence. This method
is a proxy method which is the equivalent of calling the C<sentence> method on
the L<Faker::Provider::Lorem> class.

=method lorem_sentences

    $faker->lorem_sentences; # odit qui provident et quia.

The lorem_sentences method generates a random ficticious sentences. This method
is a proxy method which is the equivalent of calling the C<sentences> method on
the L<Faker::Provider::Lorem> class.

=method lorem_word

    $faker->lorem_word; # utim

The lorem_word method generates a random ficticious word. This method is a
proxy method which is the equivalent of calling the C<word> method on the
L<Faker::Provider::Lorem> class.

=method lorem_words

    $faker->lorem_words; # consequatur suscipit asperiores sed similique

The lorem_words method generates a random ficticious words. This method is a
proxy method which is the equivalent of calling the C<words> method on the
L<Faker::Provider::Lorem> class.

=method person_first_name

    $faker->person_first_name; # Jane

The person_first_name method generates a random ficticious first name. This
method is a proxy method which is the equivalent of calling the C<first_name>
method on the L<Faker::Provider::Person> class.

=method person_last_name

    $faker->person_last_name; # Doe

The person_last_name method generates a random ficticious last name. This
method is a proxy method which is the equivalent of calling the C<last_name>
method on the L<Faker::Provider::Person> class.

=method person_name

    $faker->person_name; # Jane Doe

The person_name method generates a random ficticious full name. This method is
a proxy method which is the equivalent of calling the C<name> method on the
L<Faker::Provider::Person> class.

=method person_name_prefix

    $faker->person_name_prefix; # Ms.

The person_name_prefix method generates a random ficticious name prefix. This
method is a proxy method which is the equivalent of calling the C<name_prefix>
method on the L<Faker::Provider::en_US::Person> class.

=method person_name_suffix

    $faker->person_name_suffix; # IV

The person_name_suffix method generates a random ficticious name suffix. This
method is a proxy method which is the equivalent of calling the C<name_suffix>
method on the L<Faker::Provider::en_US::Person> class.

=method person_username

    $faker->person_username; # John74

The person_username method generates a random ficticious username. This method
is a proxy method which is the equivalent of calling the C<username> method on
the L<Faker::Provider::Person> class.

=method telephone_number

    $faker->telephone_number; # 319-193-6964

The telephone_number method generates a random ficticious telephone number.
This method is a proxy method which is the equivalent of calling the C<number>
method on the L<Faker::Provider::Telephone> class.

=cut

=head1 ACKNOWLEDGEMENTS

Some parts of this library were adopted from the following implementations.

=over 4

=item *

JS Faker L<https://github.com/Marak/faker.js>

=item *

PHP Faker L<https://github.com/fzaninotto/Faker>

=item *

Python Faker L<https://github.com/joke2k/faker>

=item *

Ruby Faker L<https://github.com/stympy/faker>

=back

=cut
