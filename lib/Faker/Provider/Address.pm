package Faker::Provider::Address;

use Bubblegum::Class;
use Bubblegum::Constraints -minimal;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) =
        (shift, _obj(shift), _str(shift));

    return 'street_name' if $format =~ /^(street)$/;
    return 'address'     if $format =~ /^(streetaddress)$/;
    return 'postal_code' if $format =~ /^(zip(_)?code?|postalcode|postcode)$/;

    $self->$orig($format);
};

sub address {
    my $self   = _obj shift;
    my $data   = _href $self->data;
    my $format = $self->random_item($data->{address_data_formats});
    return $self->linify($self->generator->parse($format));
}

sub building_number {
    my $self   = _obj shift;
    my $data   = _href $self->data;
    my $format = $self->random_item($data->{building_number_data});
    return $self->generator->parse($format);
}

sub city {
    my $self   = _obj shift;
    my $data   = _href $self->data;
    my $format = $self->random_item($data->{city_data_formats});
    return $self->generator->parse($format);
}

sub country_name {
    my $self = _obj shift;
    my $data = _href $self->data;
    return $self->random_item($data->{country_name_data});
}

sub city_suffix {
    my $self = _obj shift;
    my $data = _href $self->data;
    return $self->random_item($data->{city_suffix_data});
}

sub latitude {
    my $string = (int(rand(90000000)), int(rand(-90000000)))[rand 2];
    $string =~ s/\d*(\d\d)(\d{6})$/$1.$2/;
    return $string;
}

sub longitude {
    my $string = (int(rand(90000000)), int(rand(-90000000)))[rand 2];
    $string =~ s/\d*(\d\d)(\d{6})$/$1.$2/;
    return $string;
}

sub postal_code {
    my $self   = _obj shift;
    my $data   = _href $self->data;
    my $format = $self->random_item($data->{postal_code_data});
    return $self->generator->parse($format);
}

sub street_address {
    my $self   = _obj shift;
    my $data   = _href $self->data;
    my $format = $self->random_item($data->{street_address_data_formats});
    return $self->generator->parse($format);
}

sub street_name {
    my $self   = _obj shift;
    my $data   = _href $self->data;
    my $format = $self->random_item($data->{street_name_data_formats});
    return $self->generator->parse($format);
}

sub street_suffix {
    my $self = _obj shift;
    my $data = _href $self->data;
    return $self->random_item($data->{street_suffix_data});
}

1;

__DATA__

@@ address_data_formats
{{street_address}}, {{city}}, {{postal_code}}

@@ building_number_data
%
%%
%%%%

@@ city_data_formats
{{first_name}}{{city_suffix}}

@@ city_suffix_data
burg
ford
town
ville

@@ postal_code_data
#####
#####-####

@@ street_address_data_formats
{{building_number}} {{street_name}}

@@ street_name_data_formats
{{last_name}} {{street_suffix}}

@@ street_suffix_data
Avenue
Circle
Parkway
Street
