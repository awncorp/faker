package Faker::Role::Selector;

use Bubblegum::Role;

sub select_random_between {
    my $self = shift;
    my $from = shift;
    my $to   = shift // 0;

    $to   = 2147483647 if !$to || $to > 2147483647; # 32bit compat default
    $from = 0 if $from > 2147483647;

    return $from + int rand($to - $from);
}

sub select_random_digit {
    return int rand(10); # 0-9
}

sub select_random_digit_not_zero {
    return 1 + int rand(8); # 1-9
}

sub select_random_number {
    my $self  = shift;
    my $range = shift // 0;
    my $upto  = shift // 0;

    $range //= $self->select_random_digit;

    return $self->number_between($range, $upto) if $upto;
    return int rand(10**$range-1);
}

sub select_random_element {
    my $self = shift;
    my $hash = shift // {};

    return undef unless $hash->keys->count;
    return $hash->get($self->select_random_item($hash->keys));
}

sub select_random_float {
    my $self = shift;
    my $decimals = shift // $self->select_random_digit;

    my $min = shift;
    my $max = shift // $self->select_random_number;

    if ($min > $max) {
        my $tmp = $min;
        $min = $max;
        $max = $tmp;
    }

    return sprintf "%.${decimals}f", $min + rand() * ($max - $min);
}

sub select_random_item {
    my $self  = shift;
    my $items = shift;

    return $items->random;
}

sub select_random_letter {
    my $self = shift;
    return chr $self->select_random_between(97, 122);
}

1;
