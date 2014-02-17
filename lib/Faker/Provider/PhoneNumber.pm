package Faker::Provider::PhoneNumber;

use Bubblegum::Class;
use Bubblegum::Syntax -types;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) =
        (shift, type_obj(shift), type_str(shift));

    given ($format) {
        when (/^(phonenumber|phone|telephone)$/) {
            return 'phone_number';
        }
    }

    $self->$orig($format);
};

sub phone_number {
    my $self   = type_obj shift;
    my $data   = type_href $self->data;
    my $format = $self->random_item($data->{phone_number_data_formats});
    return $self->generator->parse($format);
}

1;

__DATA__

@@ phone_number_data_formats
###-###-####
### ### ####
(###) ###-####
