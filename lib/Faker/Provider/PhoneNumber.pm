package Faker::Provider::PhoneNumber;

use Bubblegum::Class;
use Bubblegum::Constraints -minimal;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) =
        (shift, _obj(shift), _str(shift));

    return 'phone_number' if $format =~ /^(phonenumber|phone|telephone)$/;

    $self->$orig($format);
};

sub phone_number {
    my $self   = _obj shift;
    my $data   = _href $self->data;
    my $format = $self->random_item($data->{phone_number_data_formats});
    return $self->generator->parse($format);
}

1;

__DATA__

@@ phone_number_data_formats
###-###-####
### ### ####
(###) ###-####
