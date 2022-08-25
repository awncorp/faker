package Faker::Plugin::EsEs::JargonTermSuffix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_jargon_term_suffix());
}

sub data_for_jargon_term_suffix {
  state $jargon_term_suffix = [
    'abilities',
    'access',
    'adapters',
    'algorithms',
    'alliances',
    'analyzers',
    'applications',
    'approaches',
    'architectures',
    'archives',
    'artificial intelligence',
    'arrays',
    'attitudes',
    'benchmarks',
    'budgetary management',
    'capabilities',
    'capacities',
    'challenges',
    'circuits',
    'collaborations',
    'complexity',
    'concepts',
    'conglomeration',
    'contingencies',
    'cores',
    'customer loyalty',
    'databases',
    'data-warehouses',
    'definitions',
    'emulations',
    'encodings',
    'encryptions',
    'extranets',
    'firmwares',
    'flexibilities',
    'focus groups',
    'forecasts',
    'framings',
    'frameworks',
    'functions',
    'functionalities',
    'graphic interfaces',
    'groupware',
    'graphical user interfaces',
    'hardware',
    'help-desk',
    'hierarchies',
    'hubs',
    'implementations',
    'info-mediaries',
    'infrastructures',
    'initiatives',
    'installations',
    'instruction sets',
    'interfaces',
    'internet solutions',
    'intranets',
    'knowledge workers',
    'knowledgebases',
    'local area networks',
    'matrices',
    'methodologies',
    'middlewares',
    'migrations',
    'models',
    'moderators',
    'monitoring',
    'moratoriums',
    'neural-nets',
    'open architectures',
    'open systems',
    'orchestrations',
    'paradigms',
    'parallelism',
    'policies',
    'portals',
    'pricing structures',
    'process improvements',
    'products',
    'productivity',
    'projects',
    'projection',
    'protocols',
    'secured lines',
    'service-desks',
    'software',
    'solutions',
    'standardization',
    'strategies',
    'structures',
    'successes',
    'superstructures',
    'support',
    'synergies',
    'system engines',
    'task-forces',
    'throughput',
    'time-frames',
    'toolsets',
    'utilisation',
    'websites',
    'workforces',
  ]
}

1;
