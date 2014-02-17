package Faker::Provider::Person;

use Bubblegum::Class;
use Bubblegum::Syntax -types;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) =
        (shift, type_obj(shift), type_str(shift));

    given ($format) {
        when (/^(firstname|fname)$/) {
            return 'name';
        }
        when (/^(lastname|lname)$/) {
            return 'name';
        }
    }

    $self->$orig($format);
};

sub name {
    my $self   = type_obj shift;
    my $data   = type_href $self->data;
    my $format = $self->random_item($data->{name_data_formats});
    return $self->generator->parse($format);
}

sub first_name {
    my $self = type_obj shift;
    my $data = type_href $self->data;
    return $self->random_item($data->{first_name_data});
}

sub last_name {
    my $self = type_obj shift;
    my $data = type_href $self->data;
    return $self->random_item($data->{last_name_data});
}

1;

__DATA__

@@ first_name_data
John
Jane

@@ last_name_data
Doe

@@ name_data_formats
{{first_name}} {{last_name}}
