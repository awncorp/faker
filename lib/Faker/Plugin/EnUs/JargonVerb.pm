package Faker::Plugin::EnUs::JargonVerb;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_jargon_verb());
}

sub data_for_jargon_verb {
  state $jargon_verb = [
    'implement',
    'utilize',
    'integrate',
    'streamline',
    'optimize',
    'evolve',
    'transform',
    'embrace',
    'enable',
    'orchestrate',
    'leverage',
    'reinvent',
    'aggregate',
    'architect',
    'enhance',
    'incentivize',
    'morph',
    'empower',
    'envisioneer',
    'monetize',
    'harness',
    'facilitate',
    'seize',
    'disintermediate',
    'synergize',
    'strategize',
    'deploy',
    'brand',
    'grow',
    'target',
    'syndicate',
    'synthesize',
    'deliver',
    'mesh',
    'incubate',
    'engage',
    'maximize',
    'benchmark',
    'expedite',
    'reintermediate',
    'whiteboard',
    'visualize',
    'repurpose',
    'innovate',
    'scale',
    'unleash',
    'drive',
    'extend',
    'engineer',
    'revolutionize',
    'generate',
    'exploit',
    'transition',
    'e-enable',
    'iterate',
    'cultivate',
    'matrix',
    'productize',
    'redefine',
    'recontextualize',
  ]
}

1;
