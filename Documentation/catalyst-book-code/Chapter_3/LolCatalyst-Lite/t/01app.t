 use strict;
 use warnings;
#  use Test::More qw/no_plan/;
use Test::More tests => 13;


 BEGIN { use_ok 'Catalyst::Test', 'LolCatalyst::Lite' }
 use HTTP::Headers;
 use HTTP::Request::Common;

 # GET request

 my $request = GET('http://localhost');
 my $response = request($request);
 ok( $response = request($request), 'Request');
 ok( $response->is_success, 'Response Successful 2xx' );
 is( $response->content_type, 'text/html', 'Response Content-Type' );
 like( $response->content, qr/Translate/, "contains translated string");

 # test request to translate

 $request = POST(
         'http://localhost/translate',
         'Content-Type' => 'form-data',
         'Content'      => [
             'lol' => 'Can i have a cheese burger?',
         ]);

 ok( $response = request($request), 'Request');
 ok( $response->is_success, 'Response Successful 2xx' );
 is( $response->content_type, 'text/html', 'Response Content-Type' );
 like( $response->content, qr/CHEEZ/, "contains translated string");

 # test request to translate_service

 $request = POST(
         'http://localhost/translate_service',
         'Content-Type' => 'form-data',
         'Content'      => [
             'lol' => 'Can i have a cheese burger?',
         ]);
 ok($response = request($request), 'Request');
 ok( $response->is_success, 'Response Successful 2xx' );
 is( $response->content_type, 'application/json', 'Response Content-Type' );
 like( $response->content, qr/CHEEZ/, "contains translated string");


