 use strict;
 use warnings;

 use Test::More tests => 13;

 BEGIN {
     use_ok 'Catalyst::Test', 'LolCatalyst::Lite';
 }

 use HTTP::Headers;
 use HTTP::Request::Common;

diag <<EOF

*********************************WARNING*****************************
The APP_TEST environment varialble is not set.  Please run this test
script with the APP_TEST variable set to one (e.g. APP_TEST=1 $0 ) to
ensure that the authentication component of the application is tested
properly
EOF
if !$ENV{APP_TEST};
 

     # test request to translate

     my $request = GET('http://localhost');
     $request->headers->authorization_basic('fred', 'wilma');
     my $response = request($request);
     ok( $response = request($request), 'Request');
     ok( $response->is_success, 'Response Successful 2xx' );
     is( $response->content_type, 'text/html', 'Response Content-Type' );
     like( $response->content, qr/Translate/, "contains translated string");

     # translate request
     $request = POST(
         'http://localhost/translate',
         'Content-Type' => 'form-data',
         'Content'      => [
             'lol' => 'Can i have a cheese burger?',
         ]);
      # $request->headers->authorization_basic('fred', 'wilma');
     ok( $response = request($request), 'Request');
     ok( $response->is_success, 'Response Successful 2xx' );
     is( $response->content_type, 'text/html', 'Response Content-Type' );
     like( $response->content, qr/CHEEZ/, "contains translated string");

     # test request to translate_service
 SKIP: {
     skip "Set APP_TEST for the tests to run fully",
         4 if !$ENV{APP_TEST};
     $request = POST(
         'http://localhost/translate_service',
         'Content-Type' => 'form-data',
         'Content'      => [
             'lol' => 'Can i have a cheese burger?',
         ]);
     $request->headers->authorization_basic('fred', 'wilma');
     ok($response = request($request), 'Request');
     ok( $response->is_success, 'Response Successful 2xx' );
     is( $response->content_type, 'application/json', 'Response Content-Type' );
     like( $response->content, qr/CHEEZ/, "contains translated string");

 }
