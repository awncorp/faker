package Faker::Plugin::HttpUserAgent;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

use POSIX 'strftime';

# VERSION

our $VERSION = '1.18';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $faker = $self->faker;
  my $random = $faker->random;
  my $class = 'Mozilla';
  my $version = join '.', $random->range(5, 9), $random->range(0, 9);
  my $product = join '/', $class, $version;
  my $this_year = strftime '%Y', localtime;
  my $rand_year = $random->select([($this_year-20)..$this_year]);
  my $engine = join '/', 'Gecko', join('', $rand_year, (strftime '%m%d', localtime));
  my $platform = $random->select([
    ['Macintosh', ['Mac OS ##.#', 'Max OS X ##.#'], ['Chrome', 'Safari']],
    ['Windows', ['Windows ##.#', 'Windows NT ##.#'], ['Chrome', 'Edge', 'Firefox']],
    ['X11', ['Linux x86', 'Linux x86_64'], ['Chrome', 'Firefox']],
  ]);
  my $locale = $random->select([
    'cs-CZ',
    'da-DK',
    'de-DE',
    'en-GB',
    'en-US',
    'es-ES',
    'ja-JP',
    'nb-NO',
    'pl-PL',
    'pt-BR',
    'sv-SE',
    'tr-TR',
    'zh-CN',
    'zh-TW',
  ]);
  my $software = join ':', 'rv', $faker->software_version;
  my $os_name = $platform->[0];
  my $os_desc = $self->process_markers(
    $self->process_format($random->select($platform->[1]))
  );
  my $comment = sprintf('(%s)', join('; ', $os_name, 'U', $os_desc, $software));
  my $client = $random->select($platform->[2]);
  my $client_version = $faker->software_version;
  my $user_agent = "$product $comment $engine $os_name $client/$client_version";

  return $user_agent;
}

1;
