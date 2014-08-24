package Faker::Provider::Person;

use Bubblegum::Class;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

sub name {
    my $self = shift;
    return $self->process_random('format_for_name');
}

sub first_name {
    my $self = shift;
    return $self->process_random('data_for_first_name');
}

sub last_name {
    my $self = shift;
    return $self->process_random('data_for_last_name');
}

1;

__DATA__

@@ format_for_name
{{first_name}} {{last_name}}

@@ data_for_first_name
John
Jane

@@ data_for_last_name
Doe
