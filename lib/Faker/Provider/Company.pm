package Faker::Provider::Company;

use 5.14.0;
use feature 'unicode_strings';
use Moo;
use Function::Parameters;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

method company {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{company_data_formats}});
    return $self->generator->parse($format);
}

1;

__DATA__

@@ company_data_formats
{{last_name}} {{company_suffix}}

@@ company_suffix_data
Pty.
Ltd.
Inc.
Co.
