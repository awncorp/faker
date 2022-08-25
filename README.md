## Faker - Extensible Fake Data Generator

Faker provides a extensible framework for generating randomized fake data.

```perl
package main;

use Faker;

my $faker = Faker->new('en-us');

my $first_name = $faker->person_name;

# "Russel Krajcik"

my $last_name = $faker->person_name;

# "Alayna Josephine Kunde"
```

## Installation

Install Faker using [cpm](https://metacpan.org/pod/App::cpm):

```bash
cpm install Faker
```

Install Faker using [cpanm](https://metacpan.org/pod/App::cpanminus):

```bash
cpanm -qn Faker
```

Install Faker using Perl:

```bash
curl -sSL https://cpanmin.us | perl - -qn Faker
```

Install Faker using Perl (from GitHub):

```bash
curl -ssL https://cpanmin.us | perl - -qn git://github.com/awncorp/faker.git
```

## Features

- Simple modular plugin-based architecture
- Support for I18N with En-Us, Es-Es, and Ja-Jp built-in
- Generator caching for more realistic relational fake data
- Optimized for minimal memory footprint

## Founder

- [@awncorp](https://github.com/awncorp)

## Contributing

We rely on your contributions and feedback to improve Faker, and we love
hearing about your experiences and what we can improve upon.

All contributions are always welcome! See the [contributing
guide](https://github.com/awncorp/faker/blob/master/CONTRIBUTING.md) for ways
to get started, and please adhere to this project's [code of
conduct](https://github.com/awncorp/faker/blob/master/CODE_OF_CONDUCT.md).

## Support

For support, feel free to report an [issue](https://github.com/awncorp/faker/issues).

## License

[Apache 2](https://choosealicense.com/licenses/apache-2.0/)
