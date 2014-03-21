package Faker::Provider::DateTime;

use Bubblegum::Class;
use DateTime::TimeZone;
use DateTime;

use Bubblegum::Constraints -minimal;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) =
        (shift, _obj(shift), _str(shift));

        return 'date_this_year' if $format =~ /(_at|_on)$/;
        return 'date'           if $format =~ /(_date)$/;

    $self->$orig($format);
};

sub century {
    my $self = _obj shift;
    my $data = _href $self->data;
    return $self->random_item($data->{century_data});
}

sub date {
    my $self = _obj shift;
    return DateTime->from_epoch(
        epoch => $self->random_between(0, time))->iso8601;
}

sub date_now {
    return DateTime->now->iso8601;
}

sub date_this_century {
    my $self   = _obj shift;
    my $date   = DateTime->now;
    my $years  = $self->random_between(1, 95);
    my $months = $self->random_between(1, 11);
    my $days   = $self->random_between(1, 30);

    return $date->subtract(
        years => $years, months => $months, days => $days)->iso8601;
}

sub date_this_decade {
    my $self   = _obj shift;
    my $date   = DateTime->now;
    my $years  = $self->random_between(1, 10);
    my $months = $self->random_between(1, 11);
    my $days   = $self->random_between(1, 30);

    return $date->subtract(
        years => $years, months => $months, days => $days)->iso8601;
}

sub date_this_year {
    my $self   = _obj shift;
    my $date   = DateTime->now;
    my $months = $self->random_between(1, 10);
    my $days   = $self->random_between(1, 30);
    return $date->subtract(months => $months, days => $days)->iso8601;
}

sub time_unix {
    return int rand time;
}

sub timezone {
    my $self = _obj shift;
    return $self->random_item(DateTime::TimeZone->all_names);
}

1;

__DATA__

@@ century_data
I
II
III
IV
V
VI
VII
VIII
IX
X
XI
XII
XIII
XIV
XV
XVI
XVII
XVIII
XIX
XX
XX1
