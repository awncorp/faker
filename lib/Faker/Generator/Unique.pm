package Faker::Generator::Unique;

use Bubblegum::Class;
use Bubblegum::Constraints -minimal;
use Bubblegum::Functions 'raise';

has generator => (
    is       => 'ro',
    isa      => _obj,
    required => 1
);

has max_retries => (
    is      => 'ro',
    isa     => _str,
    default => 10000
);

my $values = {};

sub AUTOLOAD {
    my $self = _obj shift;
    my ($package, $formatter) =
        split /::(\w+)$/, our $AUTOLOAD;

    if ($formatter) {
        my $count = -1;
        while ($count++ <= $self->max_retries) {
            my $data   = $self->generator->format($formatter, @_);
            my $chksum = $data->digest->encode;
            next if exists $values->{$formatter}{$chksum};
            return $values->{$formatter}{$chksum} = $data;
        }
        raise qq{
            Maximum retries of "$count" reached without finding a unique value
        };
    }
    else {
        raise qq{
            Can't locate object method "$formatter" via package "$package"
        };
    }
}

sub DESTROY {
    # noop
}

1;
