package Faker::Provider::Company;

use Bubblegum::Class;
use Bubblegum::Constraints -minimal;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

sub company {
    my $self   = _obj shift;
    my $data   = _href $self->data;
    my $format = $self->random_item($data->{company_data_formats});
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
