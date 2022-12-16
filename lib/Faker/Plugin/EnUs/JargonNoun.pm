package Faker::Plugin::EnUs::JargonNoun;

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

  return $self->faker->random->select(data_for_jargon_noun());
}

sub data_for_jargon_noun {
  state $jargon_noun = [
    'synergies',
    'web-readiness',
    'paradigms',
    'markets',
    'partnerships',
    'infrastructures',
    'platforms',
    'initiatives',
    'channels',
    'eyeballs',
    'communities',
    'ROI',
    'solutions',
    'e-tailers',
    'e-services',
    'action-items',
    'portals',
    'niches',
    'technologies',
    'content',
    'vortals',
    'supply-chains',
    'convergence',
    'relationships',
    'architectures',
    'interfaces',
    'e-markets',
    'e-commerce',
    'systems',
    'bandwidth',
    'infomediaries',
    'models',
    'mindshare',
    'deliverables',
    'users',
    'schemas',
    'networks',
    'applications',
    'metrics',
    'e-business',
    'functionalities',
    'experiences',
    'webservices',
    'methodologies',
  ]
}

1;
