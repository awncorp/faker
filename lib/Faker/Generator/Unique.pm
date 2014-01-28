package Faker::Generator::Unique;

use 5.14.0;
use feature 'unicode_strings';
use Faker::Exception;
use Moo;
use Function::Parameters;
use Types::Standard qw(InstanceOf Str);
use Digest::MD5 qw(md5_hex);

has generator => (
    is       => 'ro',
    isa      => InstanceOf['Faker::Generator'],
    required => 1
);

has max_retries => (
    is      => 'ro',
    isa     => Str,
    default => 10000
);

my $values = {};

method AUTOLOAD (@arguments) {
    my ($package, $formatter) = split /::(\w+)$/, our $AUTOLOAD;

    if ($formatter) {
        my $count = -1;
        while ($count++ <= $self->max_retries) {
            my $data   = $self->generator->format($formatter, @arguments);
            my $chksum = md5_hex $data;

            next if exists $values->{$formatter}{$chksum};
            return $values->{$formatter}{$chksum} = $data;
        }

        Faker::Exception->throw(qq{
            Maximum retries of "$count" reached without finding a unique value
        });
    }
    else {
        Faker::Exception->throw(qq{
            Can't locate object method "$formatter" via package "$package"
        });
    }
}

method DESTROY {
    # noop
}

1;
