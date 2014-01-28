package Faker::Provider::Internet;

use 5.14.0;
use feature 'switch';
use feature 'unicode_strings';
use Moo;
use Function::Parameters;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) = @_;

    given ($format) {
        when (/^(emailaddress|email)$/) {
            return 'email_address';
        }
        when (/^(ipv4)$/) {
            return 'ip_address_v4';
        }
        when (/^(ipv6)$/) {
            return 'ip_address_v6';
        }
        when (/^(login|nickname|nick|signin)$/) {
            return 'username';
        }
    }

    $self->$orig($format);
};

method company_email_address {
    return ($self->username . '@' . $self->domain_name) =~ s/[\s,]//gr;
}

method domain_name {
    return $self->domain_word . '.' . $self->top_level_domain;
}

method domain_word {
    return lc $self->generator->format('company') =~ s/\s.*//gr;
}

method email_address {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{email_data_formats}});
    return $self->generator->parse($format) =~ s/[\s,]//gr;
}

method email_domain {
    my $data = $self->data;
    return $self->random_item(@{$data->{email_domain_data}});
}

method ip_address {
    return join '.',
        $self->random_between(0, 255),
        $self->random_between(0, 255),
        $self->random_between(0, 255),
        $self->random_between(0, 255);
}

method ip_address_v4 {
    return $self->ip_address;
}

method ip_address_v6 {
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

method safe_email_domain {
    return $self->random_item('example.com', 'example.org', 'example.net');
}

method safe_email_address {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{email_data_formats}});
    return $self->generator->parse($format) =~ s/\s//gr;
}

method top_level_domain {
    my $data = $self->data;
    return $self->random_item(@{$data->{top_level_domain_data}});
}

method url {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{url_data_formats}});
    return $self->generator->parse($format);
}

method username {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{username_data_formats}});
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
