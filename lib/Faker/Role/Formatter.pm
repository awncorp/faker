package Faker::Role::Formatter;

use Bubblegum::Role;

with 'Faker::Role::Selector';

sub format_dash_markers {
    my $self   = shift;
    my $string = shift;

    $string =~ s/[^\.\w]/-/g;
    $string =~ s/([\W])[\W]*/$1/g;
    $string =~ s/(^\W+|\W+$)//g;

    return $string;
}

sub format_lex_markers {
    my $self   = shift;
    my $string = shift // '????';

    $string =~ s/\?/$self->select_random_letter/eg;

    return $string;
}

sub format_line_markers {
    my $self   = shift;
    my $string = shift;

    $string =~ s/\\n/\n/g;

    return $string;
}

sub format_number_markers {
    my $self   = shift;
    my $string = shift // '###';

    $string =~ s/\#/$self->select_random_digit/eg;
    $string =~ s/\%/$self->select_random_digit_not_zero/eg;

    return $string;
}

1;
