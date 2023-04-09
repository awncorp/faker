package Faker::Plugin::EnUs::JargonAdjective;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_jargon_adjective());
}

sub data_for_jargon_adjective {
  state $jargon_adjective = [
    'clicks-and-mortar',
    'value-added',
    'vertical',
    'proactive',
    'robust',
    'revolutionary',
    'scalable',
    'leading-edge',
    'innovative',
    'intuitive',
    'strategic',
    'e-business',
    'mission-critical',
    'sticky',
    'one-to-one',
    '24/7',
    'end-to-end',
    'global',
    'B2B',
    'B2C',
    'granular',
    'frictionless',
    'virtual',
    'viral',
    'dynamic',
    '24/365',
    'best-of-breed',
    'killer',
    'magnetic',
    'bleeding-edge',
    'web-enabled',
    'interactive',
    'dot-com',
    'sexy',
    'back-end',
    'real-time',
    'efficient',
    'front-end',
    'distributed',
    'seamless',
    'extensible',
    'turn-key',
    'world-class',
    'open-source',
    'cross-platform',
    'cross-media',
    'synergistic',
    'bricks-and-clicks',
    'out-of-the-box',
    'enterprise',
    'integrated',
    'impactful',
    'wireless',
    'transparent',
    'next-generation',
    'cutting-edge',
    'user-centric',
    'visionary',
    'customized',
    'ubiquitous',
    'plug-and-play',
    'collaborative',
    'compelling',
    'holistic',
    'rich',
  ]
}

1;
