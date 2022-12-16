package Faker::Plugin::SoftwareName;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.17';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_software_name());
}

sub data_for_software_name {
  state $software_name = [
    'Redhold',
    'Treeflex',
    'Trippledex',
    'Kanlam',
    'Bigtax',
    'Daltfresh',
    'Toughjoyfax',
    'Mat lam tam',
    'Otcom',
    'Tres-zap',
    'Y-solowarm',
    'Tresom',
    'Voltsillam',
    'Biodex',
    'Greenlam',
    'Viva',
    'Matsoft',
    'Temp',
    'Zoolab',
    'Subin',
    'Rank',
    'Job',
    'Stringtough',
    'Tin',
    'It',
    'Home ing',
    'Zamit',
    'Sonsing',
    'Konklab',
    'Alpha',
    'Latlux',
    'Voyatouch',
    'Alphazap',
    'Holdlamis',
    'Zaam-dox',
    'Sub-ex',
    'Quo lux',
    'Bamity',
    'Ventosanzap',
    'Lotstring',
    'Hatity',
    'Tempsoft',
    'Overhold',
    'Fixflex',
    'Konklux',
    'Zontrax',
    'Tampflex',
    'Span',
    'Namfix',
    'Transcof',
    'Stim',
    'Fix san',
    'Sonair',
    'Stronghold',
    'Fintone',
    'Y-find',
    'Opela',
    'Lotlux',
    'Ronstring',
    'Zathin',
    'Duobam',
    'Keylex',
  ]
}

1;
