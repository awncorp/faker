package Faker::Generator;

use Bubblegum::Class;
use Bubblegum::Syntax -types, -typesof, 'raise';

with 'Faker::Role::Utility';

has formatters => (
    is      => 'ro',
    isa     => typeof_href,
    lazy    => 1,
    default => sub {{}}
);

has providers => (
    is      => 'ro',
    isa     => typeof_aref,
    lazy    => 1,
    default => sub {[]}
);

sub format {
    my $self      = type_obj shift;
    my $formatter = type_str shift;
    my @arguments = map type_def($_), @_;
    return $self->find_formatter($formatter)->(@arguments);
}

sub find_formatter {
    my $self       = type_obj shift;
    my $formatter  = type_str shift;
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
    my $self   = type_obj shift;
    my $string = type_str shift // '';

    if ($string) {
        $string =~ s/\{\{\s?(\w+)\s?\}\}/$self->format($1)/eg;
        $string = $self->bothify($string);
    }

    return $string;
}

sub register_provider {
    my $self     = type_obj shift;
    my $provider = type_obj shift;
    return $self->providers->unshift($provider);
}

sub seed {
    return srand pop;
}

sub AUTOLOAD {
    my $self      = type_obj shift;
    my @arguments = map type_def($_), @_;
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
