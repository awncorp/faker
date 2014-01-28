package Faker::Generator;

use 5.14.0;
use feature 'switch';
use feature 'unicode_strings';
use Faker::Exception;
use Moo;
use Function::Parameters;
use Types::Standard qw(ArrayRef HashRef);

with 'Faker::Role::Utility';

has formatters => (
    is      => 'ro',
    isa     => HashRef,
    lazy    => 1,
    default => sub {{}}
);

has providers => (
    is      => 'ro',
    isa     => ArrayRef,
    lazy    => 1,
    default => sub {[]}
);

method add_provider ($provider) {
    return unshift @{$self->providers}, $provider;
}

method format ($formatter, @arguments) {
    return $self->get_formater($formatter)->(@arguments);
}

method get_formater ($formatter) {
    my $formatters = $self->formatters;

    return $formatters->{$formatter}
        if defined $formatters->{$formatter};

    for my $provider (@{$self->providers}) {
        if (my $code = $provider->can($formatter)) {
            return $formatters->{$formatter} = sub {
                return $code->($provider, @_);
            };
        }
    }

    for my $provider (@{$self->providers}) {
        my $guessed_formatter = $provider->guesser($formatter) or next;
        if (my $code = $provider->can($guessed_formatter)) {
            return $formatters->{$formatter} =
                $formatters->{$guessed_formatter} = sub {
                    return $code->($provider, @_);
                };
        }
    }

    Faker::Exception->throw(sprintf('Unknown formatter "%s"', $formatter));
}

method get_providers {
    return $self->providers;
}

method parse ($string) {
    if ($string) {
        $string =~ s/\{\{\s?(\w+)\s?\}\}/$self->format($1)/ueg;
        $string = $self->bothify($string);
    }
    return $string;
}

method seed ($seed) {
    return srand $seed;
}

method AUTOLOAD (@arguments) {
    my ($package, $formatter) = split /::(\w+)$/, our $AUTOLOAD;

    if ($formatter) {
        return $self->format($formatter, @arguments);
    }

    Faker::Exception->throw(
        qq{Can't locate object method "$formatter" via package "$package"}
    );
}

1;
