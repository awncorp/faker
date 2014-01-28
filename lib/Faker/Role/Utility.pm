package Faker::Role::Utility;

use 5.14.0;
use feature 'unicode_strings';
use Moo::Role;
use Function::Parameters;

method bothify ($string='### ???') {
    return $self->lexify($self->numerify($string));
}

method lexify ($string='????') {
    $string =~ s/\?/$self->random_letter/ueg;
    return $string;
}

method linify ($string) {
    $string =~ s/\\n/\n/ug;
    return $string;
}

method numerify ($string='###') {
    $string =~ s/\#/$self->random_digit/ueg;
    $string =~ s/\%/$self->random_digit_not_zero/ueg;
    return $string;
}

method random_between ($from, $to) {
    $to   = 2147483647 if !$to || $to > 2147483647; # 32bit compat default
    $from = 0 if $from > 2147483647;

    my $int = $from + int rand($to - $from);
    return $int;
}

method random_digit {
    return int rand(10); # 0-9
}

method random_digit_not_zero {
    return 1 + int rand(8); # 1-9
}

method random_number ($range, $upto) {
    $range //= $self->random_digit;

    return $self->number_between($range, $upto) if $upto;
    return int rand(10**$range-1);
}

method random_element ($hash) {
    return $hash ? $hash->{$self->random_item(keys %{$hash})} : undef;
}

method random_float ($decimals, $min, $max) {
    $decimals //= $self->random_digit;
    $max      //= $self->random_number;

    if ($min > $max) {
        my $tmp = $min;
        $min = $max;
        $max = $tmp;
    }

    return sprintf "%.${decimals}f", $min + rand() * ($max - $min);
}

method random_item (@items) {
    return $items[rand @items];
}

method random_letter {
    return chr $self->random_between(97, 122);
}

1;
