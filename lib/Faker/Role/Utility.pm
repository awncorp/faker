package Faker::Role::Utility;

use Bubblegum::Role;
use Bubblegum::Constraints -minimal;

sub bothify {
    my $self   = _obj shift;
    my $string = _str shift // '### ???';
    return $self->lexify($self->numerify($string));
}

sub dashify {
    my $self   = _obj shift;
    my $string = _str shift;
    $string =~ s/[^\.\w]/-/g;
    $string =~ s/([\W])[\W]*/$1/g;
    $string =~ s/(^\W+|\W+$)//g;
    return $string;
}

sub lexify {
    my $self   = _obj shift;
    my $string = _str shift // '????';
    $string =~ s/\?/$self->random_letter/eg;
    return $string;
}

sub linify {
    my $self   = _obj shift;
    my $string = _str shift;
    $string =~ s/\\n/\n/g;
    return $string;
}

sub numerify {
    my $self   = _obj shift;
    my $string = _str shift // '###';
    $string =~ s/\#/$self->random_digit/eg;
    $string =~ s/\%/$self->random_digit_not_zero/eg;
    return $string;
}

sub random_between {
    my $self = _obj shift;
    my $from = _int shift;
    my $to   = _int shift // 0;
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
    my $self  = _obj shift;
    my $range = _int shift // 0;
    my $upto  = _int shift // 0;
    $range //= $self->random_digit;
    return $self->number_between($range, $upto) if $upto;
    return int rand(10**$range-1);
}

sub random_element {
    my $self = _obj shift;
    my $hash = _href shift // {};
    return $hash->keys->count ?
        $hash->get($self->random_item($hash->keys)) : undef;
}

sub random_float {
    my $self     = _obj shift;
    my $decimals = _int shift // $self->random_digit;
    my $min      = _int shift;
    my $max      = _int shift // $self->random_number;

    if ($min > $max) {
        my $tmp = $min;
        $min = $max;
        $max = $tmp;
    }

    return sprintf "%.${decimals}f",
        $min + rand() * ($max - $min);
}

sub random_item {
    my $self  = _obj  shift;
    my $items = _aref shift;
    return $items->random;
}

sub random_letter {
    my $self = _obj shift;
    return chr $self->random_between(97, 122);
}

1;
