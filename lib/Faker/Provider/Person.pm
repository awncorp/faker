package Faker::Provider::Person;

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
        when (/^(firstname|fname)$/) {
            return 'name';
        }
        when (/^(lastname|lname)$/) {
            return 'name';
        }
    }

    $self->$orig($format);
};

method name {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{name_data_formats}});
    $self->generator->parse($format);
}

method first_name {
    my $data = $self->data;
    return $self->random_item(@{$data->{first_name_data}});
}

method last_name {
    my $data = $self->data;
    return $self->random_item(@{$data->{last_name_data}});
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
