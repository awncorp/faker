package Faker::Provider::DateTime;

use 5.14.0;
use feature 'switch';
use feature 'unicode_strings';
use Moo;
use Function::Parameters;
use DateTime;
use DateTime::TimeZone;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) = @_;

    given ($format) {
        when (/(_at|_on)$/) {
            return 'date_this_year';
        }
        when (/(_date)$/) {
            return 'date';
        }
    }

    $self->$orig($format);
};

method century {
    my $data = $self->data;
    return $self->random_item(@{$data->{century_data}});
}

method date {
    return DateTime->from_epoch(
        epoch => $self->random_between(0, time))->iso8601;
}

method date_now {
    return DateTime->now->iso8601;
}

method date_this_century {
    my $date   = DateTime->now;
    my $years  = $self->random_between(1, 95);
    my $months = $self->random_between(1, 11);
    my $days   = $self->random_between(1, 30);

    return $date->subtract(
        years => $years, months => $months, days => $days)->iso8601;
}

method date_this_decade {
    my $date   = DateTime->now;
    my $years  = $self->random_between(1, 10);
    my $months = $self->random_between(1, 11);
    my $days   = $self->random_between(1, 30);

    return $date->subtract(
        years => $years, months => $months, days => $days)->iso8601;
}

method date_this_year {
    my $date   = DateTime->now;
    my $months = $self->random_between(1, 10);
    my $days   = $self->random_between(1, 30);
    return $date->subtract(months => $months, days => $days)->iso8601;
}

method time_unix {
    return int rand time;
}

method timezone {
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
