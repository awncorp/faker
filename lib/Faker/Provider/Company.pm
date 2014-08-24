package Faker::Provider::Company;

use Bubblegum::Class;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

sub name {
    my $self = shift;
    return $self->process_random('format_for_name');
}

sub name_suffix {
    my $self = shift;
    return $self->process_random('data_for_name_suffix');
}

1;

__DATA__

@@ format_for_name
{{Person#last_name}} {{name_suffix}}

@@ data_for_name_suffix
Pty.
Ltd.
Inc.
Co.
