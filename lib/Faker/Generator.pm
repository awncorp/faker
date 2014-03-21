package Faker::Generator;

use Bubblegum::Class;
use Bubblegum::Constraints -minimal;
use Bubblegum::Functions 'raise';

with 'Faker::Role::Utility';

has formatters => (
    is      => 'ro',
    isa     => _href,
    lazy    => 1,
    default => sub {{}}
);

has providers => (
    is      => 'ro',
    isa     => _aref,
    lazy    => 1,
    default => sub {[]}
);

sub format {
    my $self      = _obj shift;
    my $formatter = _str shift;
    my @arguments = map _def($_), @_;
    return $self->find_formatter($formatter)->(@arguments);
}

sub find_formatter {
    my $self       = _obj shift;
    my $formatter  = _str shift;
    my $formatters = $self->formatters;

    return $formatters->{$formatter}
        if defined $formatters->{$formatter};

    for my $provider ($self->providers->list) {
        if (my $code = $provider->can($formatter)) {
            return $formatters->{$formatter} = sub {
                return $code->($provider, @_);
            };
        }
    }

    for my $provider ($self->providers->list) {
        my $guessed_formatter = $provider->guesser($formatter) or next;
        if (my $code = $provider->can($guessed_formatter)) {
            return $formatters->{$formatter} =
                $formatters->{$guessed_formatter} = sub {
                    return $code->($provider, @_);
                };
        }
    }

    raise sprintf 'Unknown formatter "%s"', $formatter;
}

sub parse {
    my $self   = _obj shift;
    my $string = _str shift // '';

    if ($string) {
        $string =~ s/\{\{\s?(\w+)\s?\}\}/$self->format($1)/eg;
        $string = $self->bothify($string);
    }

    return $string;
}

sub register_provider {
    my $self     = _obj shift;
    my $provider = _obj shift;
    return $self->providers->unshift($provider);
}

sub seed {
    return srand pop;
}

sub AUTOLOAD {
    my $self      = _obj shift;
    my @arguments = map _def($_), @_;
    my ($package, $formatter) = split /::(\w+)$/, our $AUTOLOAD;

    if ($formatter) {
        return $self->format($formatter, @arguments);
    }

    raise qq{
        Can't locate object method "$formatter" via package "$package"
    };
}

sub DESTROY {
    # noop
}

1;
