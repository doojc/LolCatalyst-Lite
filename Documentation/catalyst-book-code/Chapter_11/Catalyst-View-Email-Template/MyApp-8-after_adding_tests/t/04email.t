use strict;
use warnings;
use Test::More tests => 9;

use Email::Send::Test;
use FindBin;
use lib "$FindBin::Bin/lib";

BEGIN {
    $ENV{MYAPP_CONFIG_LOCAL_SUFFIX} = 'test';
}

use_ok('Catalyst::Test', 'MyApp');

ok( (my $response = request("/"))->is_success, 'request ok');

my @emails = Email::Send::Test->emails;

is(@emails, 1, "got one email");
isa_ok( $emails[0], 'Email::MIME', 'email is ok' );
like($emails[0]->content_type, qr/^multipart\/alternative/, 'email is multipart');
my @parts = $emails[0]->parts;
is($parts[0]->content_type, 'text/plain; charset="utf-8"', 'first part is text/plain');
is($parts[1]->content_type, 'text/html; charset="utf-8"', 'second part is text/html');
like($parts[0]->body, qr/^MyApp sent you an email!\nThe IP of the client was/, 'text/plain body ok');
like($parts[1]->body, qr/<body>\nMyApp sent you an email!\nThe IP of the client was/, 'text/html body ok');
