package Faker::Provider::Address;

use 5.14.0;
use feature 'switch';
use feature 'unicode_strings';
use Moo;
use Function::Parameters;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) = @_;

    given ($format) {
        when (/^(street)$/) {
            return 'street_name';
        }
        when (/^(streetaddress)$/) {
            return 'address';
        }
        when (/^(zip_code|zipcode|zip|postalcode|postcode)$/) {
            return 'postal_code';
        }
    }

    $self->$orig($format);
};

method address {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{address_data_formats}});
    return $self->linify($self->generator->parse($format));
}

method building_number {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{building_number_data}});
    return $self->generator->parse($format);
}

method city {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{city_data_formats}});
    return $self->generator->parse($format);
}

method country_name {
    my $data = $self->data;
    return $self->random_item(@{$data->{country_name_data}});
}

method city_suffix {
    my $data = $self->data;
    return $self->random_item(@{$data->{city_suffix_data}});
}

method latitude {
    (int(rand(90000000)), int(rand(-90000000)))[rand 2]
        =~ s/\d*(\d\d)(\d{6})$/$1.$2/r;
}

method longitude {
    (int(rand(90000000)), int(rand(-90000000)))[rand 2]
        =~ s/\d*(\d\d)(\d{6})$/$1.$2/r;
}

method postal_code {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{postal_code_data}});
    return $self->generator->parse($format);
}

method street_address {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{street_address_data_formats}});
    return $self->generator->parse($format);
}

method street_name {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{street_name_data_formats}});
    return $self->generator->parse($format);
}

method street_suffix {
    my $data = $self->data;
    return $self->random_item(@{$data->{street_suffix_data}});
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
