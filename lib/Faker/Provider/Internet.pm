package Faker::Provider::Internet;

use Bubblegum::Class;
use Bubblegum::Syntax -types;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) =
        (shift, type_obj(shift), type_str(shift));

    return 'email_address' if $format =~ /^(emailaddress|email)$/;
    return 'ip_address_v4' if $format =~ /^(ipv4)$/;
    return 'ip_address_v6' if $format =~ /^(ipv6)$/;
    return 'username'      if $format =~ /^(login|nickname|nick|signin)$/;

    $self->$orig($format);
};

sub company_email_address {
    my $self   = type_obj shift;
    my $string = $self->username . '@' . $self->domain_name;
    return $self->dashify($string);
}

sub domain_name {
    my $self = type_obj shift;
    return $self->domain_word . '.' . $self->top_level_domain;
}

sub domain_word {
    my $self = type_obj shift;
    my $string = lc $self->generator->format('company');
    return $self->dashify($string);
}

sub email_address {
    my $self   = type_obj shift;
    my $data   = type_href $self->data;
    my $format = $self->random_item($data->{email_data_formats});
    my $string = $self->generator->parse($format);
    return $self->dashify($string);
}

sub email_domain {
    my $self = type_obj shift;
    my $data = type_href $self->data;
    return $self->random_item($data->{email_domain_data});
}

sub ip_address {
    my $self = type_obj shift;
    return join '.',
        $self->random_between(0, 255), $self->random_between(0, 255),
        $self->random_between(0, 255), $self->random_between(0, 255);
}

sub ip_address_v4 {
    my $self = type_obj shift;
    return $self->ip_address;
}

sub ip_address_v6 {
    my $self = type_obj shift;
    return join ':',
        sprintf('%04s', sprintf("%02x", $self->random_between(0, 65535))),
        sprintf('%04s', sprintf("%02x", $self->random_between(0, 65535))),
        sprintf('%04s', sprintf("%02x", $self->random_between(0, 65535))),
        sprintf('%04s', sprintf("%02x", $self->random_between(0, 65535))),
        sprintf('%04s', sprintf("%02x", $self->random_between(0, 65535))),
        sprintf('%04s', sprintf("%02x", $self->random_between(0, 65535))),
        sprintf('%04s', sprintf("%02x", $self->random_between(0, 65535))),
        sprintf('%04s', sprintf("%02x", $self->random_between(0, 65535)));
}

sub safe_email_domain {
    my $self = type_obj shift;
    return $self->random_item('example.com', 'example.org', 'example.net');
}

sub safe_email_address {
    my $self   = type_obj shift;
    my $data   = type_href $self->data;
    my $format = $self->random_item($data->{email_data_formats});
    my $string = $self->generator->parse($format);
    return $self->dashify($string);
}

sub top_level_domain {
    my $self = type_obj shift;
    my $data = type_href $self->data;
    return $self->random_item($data->{top_level_domain_data});
}

sub url {
    my $self   = type_obj shift;
    my $data   = type_href $self->data;
    my $format = $self->random_item($data->{url_data_formats});
    return $self->generator->parse($format);
}

sub username {
    my $self   = type_obj shift;
    my $data   = type_href $self->data;
    my $format = $self->random_item($data->{username_data_formats});
    return $self->generator->parse($format);
}

1;

__DATA__

@@ email_data_formats
{{username}}@{{domain_name}}
{{username}}@{{email_domain}}

@@ email_domain_data
gmail.com
yahoo.com
hotmail.com

@@ top_level_domain_data
biz
info
net
org

@@ url_data_formats
http://www.{{domain_name}}/
http://{{domain_name}}/

@@ username_data_formats
{{last_name}}.{{first_name}}
{{first_name}}.{{last_name}}
{{first_name}}##
?{{last_name}}
