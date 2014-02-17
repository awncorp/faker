package Faker::Role::Utility;

use Bubblegum::Role;
use Bubblegum::Syntax -types;

sub bothify {
    my $self   = type_obj shift;
    my $string = type_str shift // '### ???';
    return $self->lexify($self->numerify($string));
}

sub lexify {
    my $self   = type_obj shift;
    my $string = type_str shift // '????';
    $string =~ s/\?/$self->random_letter/eg;
    return $string;
}

sub linify {
    my $self   = type_obj shift;
    my $string = type_str shift;
    $string =~ s/\\n/\n/g;
    return $string;
}

sub numerify {
    my $self   = type_obj shift;
    my $string = type_str shift // '###';
    $string =~ s/\#/$self->random_digit/eg;
    $string =~ s/\%/$self->random_digit_not_zero/eg;
    return $string;
}

sub random_between {
    my $self = type_obj shift;
    my $from = type_int shift;
    my $to   = type_int shift // 0;
    $to   = 2147483647 if !$to || $to > 2147483647; # 32bit compat default
    $from = 0 if $from > 2147483647;
    return $from + int rand($to - $from);
}

sub random_digit {
    return int rand(10); # 0-9
}

sub random_digit_not_zero {
    return 1 + int rand(8); # 1-9
}

sub random_number {
    my $self  = type_obj shift;
    my $range = type_int shift // 0;
    my $upto  = type_int shift // 0;
    $range //= $self->random_digit;
    return $self->number_between($range, $upto) if $upto;
    return int rand(10**$range-1);
}

sub random_element {
    my $self = type_obj shift;
    my $hash = type_href shift // {};
    return $hash->keys->count ?
        $hash->get($self->random_item($hash->keys)) : undef;
}

sub random_float {
    my $self     = type_obj shift;
    my $decimals = type_int shift // $self->random_digit;
    my $min      = type_int shift;
    my $max      = type_int shift // $self->random_number;

    if ($min > $max) {
        my $tmp = $min;
        $min = $max;
        $max = $tmp;
    }

    return sprintf "%.${decimals}f",
        $min + rand() * ($max - $min);
}

sub random_item {
    my $self  = type_obj  shift;
    my $items = type_aref shift;
    return $items->random;
}

sub random_letter {
    my $self = type_obj shift;
    return chr $self->random_between(97, 122);
}

1;
