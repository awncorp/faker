requires "Bubblegum" => "0.10";
requires "DateTime" => "0";
requires "DateTime::TimeZone" => "0";
requires "perl" => "v5.14.0";

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
};

on 'develop' => sub {
  requires "Test::CPAN::Changes" => "0.19";
};
