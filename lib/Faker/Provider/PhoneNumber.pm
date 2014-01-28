package Faker::Provider::PhoneNumber;

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
        when (/^(phonenumber|phone|telephone)$/) {
            return 'phone_number';
        }
    }

    $self->$orig($format);
};

method phone_number {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{phone_number_data_formats}});
    $self->generator->parse($format);
}

1;

__DATA__

@@ phone_number_data_formats
###-###-####
### ### ####
(###) ###-####
