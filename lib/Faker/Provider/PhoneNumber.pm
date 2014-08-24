package Faker::Provider::PhoneNumber;

use Bubblegum::Class;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

sub number {
    my $self = shift;
    return $self->format_number_markers(
        $self->process_random('format_for_number')
    );
}

1;

__DATA__

@@ format_for_number
###-###-####
### ### ####
(###) ###-####
