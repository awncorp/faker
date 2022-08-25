package Faker;

use 5.018;

use strict;
use warnings;

use Venus::Class 'attr', 'with';

with 'Venus::Role::Buildable';
with 'Venus::Role::Coercible';
with 'Venus::Role::Doable';
with 'Venus::Role::Proxyable';

# VERSION

our $VERSION = '1.10';

# AUTHORITY

our $AUTHORITY = 'cpan:AWNCORP';

# STATE

state $sources = {};

# ATTRIBUTES

attr 'caches';
attr 'locales';

# MODIFIERS

sub caches {
  my ($self, $data) = @_;

  if ($data) {
    return $self->{caches} = $self->coercion({caches => $data})->{caches};
  }
  else {
    return $self->{caches};
  }
}

sub locales {
  my ($self, $data) = @_;

  if ($data) {
    return $self->{locales} = $self->coercion({locales => $data})->{locales};
  }
  else {
    return $self->{locales};
  }
}

# BUILDERS

sub build_arg {
  my ($self, $data) = @_;

  return {
    locales => ref $data eq 'ARRAY' ? $data : [$data],
  };
}

sub build_args {
  my ($self, $data) = @_;

  $data->{caches} ||= {};
  $data->{locales} ||= [];

  return $data;
}

sub build_proxy {
  my ($self, $package, $method, @args) = @_;

  return sub { $self->caches->get($method) } if $self->caches->exists($method);

  return unless my $source = $self->sources($method)->random;

  return sub { $source->build(faker => $self)->execute(@args) };
}

# COERCIONS

sub coerce {
  {
    caches => 'Venus::Hash',
    locales => 'Venus::Array',
  }
}

# METHODS

sub cache {
  my ($self, $method, @args) = @_;

  return if !$method;

  my $result = $self->caches->set($method, $self->$method(@args));

  return $result;
}

sub plugin {
  my ($self, @args) = @_;

  return $self->space->child('plugin', @args);
}

sub random {
  my ($self) = @_;

  require Venus::Random;

  state $random = Venus::Random->new;

  return $random;
}

sub space {
  my ($self) = @_;

  require Venus::Space;

  state $space = Venus::Space->new(ref $self || $self);

  return $space;
}

sub sources {
  my ($self, $method) = @_;

  return if !$method;

  require Venus::Array;

  my $plugins = Venus::Array->new([$self->plugin($method)]);

  $plugins->push(map {$self->plugin($_, $method)} $self->locales->list);

  $plugins->value([grep {$$sources{"$_"} //= $_->tryload} $plugins->list]);

  return $plugins;
}

1;