package Faker::Factory;

use Bubblegum::Class;
use Bubblegum::Syntax -types, -typesof, 'load', 'raise';
use Faker::Generator;

use Class::Load 'try_load_class';
use Module::Find 'findsubmod';

has locale => (
    is      => 'ro',
    isa     => typeof_str,
    default => 'en_US'
);

has namespace => (
    is      => 'ro',
    isa     => typeof_class
);

has providers => (
    is      => 'ro',
    isa     => typeof_aref,
    lazy    => 1,
    default => sub {[
        sort map load($_), findsubmod 'Faker::Provider'
    ]}
);

sub create {
    my $self      = type_obj shift;
    my $locale    = type_str (shift // $self->locale);
    my $generator = Faker::Generator->new;

    for my $provider ($self->providers->list) {
        $provider =~ s/^Faker::Provider:://;
        my $provider_class =
            $self->load_provider($provider, $locale);
        $generator->register_provider(
            $provider_class->new(generator => $generator)
        );
    }

    return $generator;
}

sub load_provider {
    my $self     = type_obj shift;
    my $provider = type_str shift;
    my $locale   = type_str shift;
    my $provider_class;

    if ($self->namespace) {
        return $provider_class
            if $provider_class = $self->load_provider_from_namespace(
                $provider, $locale
            );
    }

    return $provider_class
        if $provider_class = $self->locate_provider(
                $provider, $locale
            );

    return $provider_class
        if $provider_class = $self->locate_provider(
                $provider, 'en_US'
            );

    return $provider_class
        if $provider_class = $self->locate_provider(
                $provider
            );

    raise sprintf 'Unable to find provider "%s" with locale "%s"',
        $provider, $locale;
}

sub load_provider_from_namespace {
    my $self     = type_obj shift;
    my $provider = type_str shift;
    my $locale   = type_str shift;
    my $provider_class;

    return $provider_class
        if $provider_class = $self->locate_provider_in_namespace(
                $provider, $locale
            );

    return $provider_class
        if $provider_class = $self->locate_provider_in_namespace(
                $provider, 'en_US'
            );

    return $provider_class
        if $provider_class = $self->locate_provider_in_namespace(
                $provider
            );

    return undef;
}

sub locate_provider {
    my $self     = type_obj shift;
    my $provider = type_str shift;
    my $locale   = shift;
    my $provider_class = join '::', 'Faker::Provider',
        $locale ? ($locale, $provider) : ($provider);

    return $provider_class if try_load_class $provider_class;
    return undef;
}

sub locate_provider_in_namespace {
    my $self     = type_obj shift;
    my $provider = type_str shift;
    my $locale   = type_str shift;
    my $provider_class = join '::', $self->namespace,
        $locale ? ($locale, $provider) : ($provider);

    return $provider_class if try_load_class $provider_class;
    return undef;
}

1;
