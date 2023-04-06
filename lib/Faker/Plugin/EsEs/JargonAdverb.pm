package Faker::Plugin::EsEs::JargonAdverb;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.18';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_jargon_adverb());
}

sub data_for_jargon_adverb {
  state $jargon_adverb = [
    'adaptive',
    'advanced',
    'ameliorated',
    'assimilated',
    'automated',
    'balanced',
    'business-focused',
    'centralized',
    'cloned',
    'compatible',
    'configurable',
    'cross-group',
    'cross-platform',
    'customer-focused',
    'customizable',
    'decentralized',
    'de-engineered',
    'devolved',
    'digitized',
    'distributed',
    'diverse',
    'down-sized',
    'enhanced',
    'enterprise-wide',
    'ergonomic',
    'exclusive',
    'expanded',
    'extended',
    'facetoface',
    'focused',
    'front-line',
    'fully-configurable',
    'function-based',
    'fundamental',
    'future-proofed',
    'grass-roots',
    'horizontal',
    'implemented',
    'innovative',
    'integrated',
    'intuitive',
    'inverse',
    'managed',
    'mandatory',
    'monitored',
    'multi-channelled',
    'multi-lateral',
    'multi-layered',
    'multi-tiered',
    'networked',
    'object-based',
    'open-architected',
    'open-source',
    'operative',
    'optimized',
    'optional',
    'organic',
    'organized',
    'persevering',
    'persistent',
    'phased',
    'polarised',
    'pre-emptive',
    'proactive',
    'profit-focused',
    'profound',
    'programmable',
    'progressive',
    'public-key',
    'quality-focused',
    'reactive',
    'realigned',
    're-contextualized',
    're-engineered',
    'reduced',
    'reverse-engineered',
    'right-sized',
    'robust',
    'seamless',
    'secured',
    'self-enabling',
    'sharable',
    'stand-alone',
    'streamlined',
    'switchable',
    'synchronised',
    'synergistic',
    'synergized',
    'team-oriented',
    'total',
    'triple-buffered',
    'universal',
    'up-sized',
    'upgradable',
    'user-centric',
    'user-friendly',
    'versatile',
    'virtual',
    'visionary',
    'vision-oriented',
  ]
}

1;
