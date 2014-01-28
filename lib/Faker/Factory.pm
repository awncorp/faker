package Faker::Factory;

use 5.14.0;
use feature 'unicode_strings';
use Faker::Exception;
use Faker::Generator;
use Moo;
use Function::Parameters;
use Class::Load qw(:all);
use Module::Find qw(findsubmod);
use Types::Standard qw(ArrayRef ClassName Str);

has locale => (
    is      => 'ro',
    isa     => Str,
    default => 'en_US'
);

has namespace => (
    is      => 'ro',
    isa     => ClassName
);

has providers => (
    is      => 'ro',
    isa     => ArrayRef,
    lazy    => 1,
    default => sub {[sort map load_class($_), findsubmod 'Faker::Provider']}
);

method create ($locale) {
    $locale = shift // $self->locale;

    my $generator = Faker::Generator->new;

    for my $provider (@{$self->providers}) {
        $provider =~ s/^Faker::Provider:://;
        my $provider_class = $self->get_provider_class($provider, $locale);
        $generator->add_provider($provider_class->new(generator => $generator));
    }

    return $generator;
}

method get_provider_class ($provider, $locale) {
    my $provider_class;

    if ($self->namespace) {
        return $provider_class
            if $provider_class = $self->get_provider_class_in_namespace(
                $provider, $locale
            );
    }

    return $provider_class
        if $provider_class = $self->find_provider_class(
                $provider, $locale
            );

    return $provider_class
        if $provider_class = $self->find_provider_class(
                $provider, 'en_US'
            );

    return $provider_class
        if $provider_class = $self->find_provider_class(
                $provider
            );

    Faker::Exception->throw(
        sprintf 'Unable to find provider "%s" with locale "%s"',
            $provider, $locale
    );
}

method get_provider_class_in_namespace ($provider, $locale) {
    my $provider_class;

    return $provider_class
        if $provider_class = $self->find_provider_class_in_namespace(
                $provider, $locale
            );

    return $provider_class
        if $provider_class = $self->find_provider_class_in_namespace(
                $provider, 'en_US'
            );

    return $provider_class
        if $provider_class = $self->find_provider_class_in_namespace(
                $provider
            );

    return undef;
}

method find_provider_class ($provider, $locale) {
    my $provider_class = join '::', 'Faker::Provider',
        $locale ? ($locale, $provider) : ($provider);

    return $provider_class if try_load_class $provider_class;
    return undef;
}

method find_provider_class_in_namespace ($provider, $locale) {
    my $provider_class = join '::', $self->namespace,
        $locale ? ($locale, $provider) : ($provider);

    return $provider_class if try_load_class $provider_class;
    return undef;
}

1;
