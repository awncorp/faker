# Faker Failure Class
package Faker::Failure;

use Bubblegum::Class;

use Bubblegum::Constraints -typesof;

extends 'Throwable::Error';

# VERSION

has '+message' => (default => 'An unexpected failure has occurred');

1;
