requires "Bubblegum" => "0.20";
requires "Bubblegum::Functions" => "0.01";
requires "DateTime" => "0";
requires "DateTime::TimeZone" => "0";
requires "perl" => "v5.14.0";

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
};

on 'develop' => sub {
  requires "Test::CPAN::Changes" => "0.19";
};
