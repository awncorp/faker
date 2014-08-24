package Faker::Provider::Address;

use Bubblegum::Class;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

sub line1 {
    my $self = shift;
    return $self->format_number_markers(
        $self->format_line_markers(
            $self->process_random('format_for_line1')
        )
    );
}

sub lines {
    my $self = shift;
    return $self->format_number_markers(
        $self->format_line_markers(
            $self->process_random('format_for_lines')
        )
    );
}

sub number {
    my $self = shift;
    return $self->process_random('data_for_number');
}

sub city_name {
    my $self = shift;
    return $self->process_random('format_for_city_name');
}

sub city_suffix {
    my $self = shift;
    return $self->process_random('data_for_city_suffix');
}

sub latitude {
    my $string = (int(rand(90000000)), int(rand(-90000000)))[rand 2];
    $string =~ s/\d*(\d\d)(\d{6})$/$1.$2/;
    return $string;
}

sub longitude {
    my $string = (int(rand(90000000)), int(rand(-90000000)))[rand 2];
    $string =~ s/\d*(\d\d)(\d{6})$/$1.$2/;
    return $string;
}

sub postal_code {
    my $self = shift;
    return $self->format_number_markers(
        $self->process_random('data_for_postal_code')
    );
}

sub street_name {
    my $self = shift;
    return $self->process_random('format_for_street_name');
}

sub street_suffix {
    my $self = shift;
    return $self->process_random('data_for_street_suffix');
}

1;

__DATA__

@@ format_for_city_name
{{Person#first_name}}{{city_suffix}}

@@ format_for_line1
{{number}} {{street_name}}

@@ format_for_lines
{{line1}}, {{city_name}}, {{postal_code}}

@@ format_for_street_name
{{Person#last_name}} {{street_suffix}}

@@ data_for_number
%
%%
%%%%

@@ data_for_city_suffix
burg
ford
town
ville

@@ data_for_postal_code
#####
#####-####

@@ data_for_street_suffix
Avenue
Circle
Parkway
Street
