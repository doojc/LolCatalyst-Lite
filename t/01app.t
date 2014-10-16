#!/usr/bin/env perl
use lib '/home/doojc/Documents/Projects/LolCatalyst-Lite/blib/lib';
use strict;
use warnings;
use Test::More qw(no_plan);

BEGIN { use_ok 'Catalyst::Test', 'LolCatalyst::Lite' }
use HTTP::Headers;
use HTTP::Request::Common;

# GET request

my $request = GET('http://0:3000');
my $response = request($request);
ok( $response = request($request), 'Basic request to start page');
ok( $response->is_success, 'Start page request successful 2xx');
is( $response->content_type, 'text/html', 'HTML Content-Type');
like( $response->content, qr/Translate/, "Contains the word Translate");

# Test request to translate
$request = POST(
	'http://0:3000/translate',
	'Content-Type' => 'form-data',
	'Content' => [ 'lol' => 'Can i have a cheese burger?']
);
$response = undef;
ok( $response = request($request), 'Request to return translation');
ok( $response->is_success, 'Translation request successful 2xx');
is( $response->content_type, 'text/html', 'HTML Content-Type');
like( $response->content, qr/CHEEZ/, "Contains a correct translation snippet");

# Test request to translate_service
#$request = POST(
#         'http://0:3000/translate_service',
#         'Content-Type' => 'form-data',
#         'Content'      => [
#             'lol' => 'Can i have a cheese burger?',
#         ]);
#     $request->headers->authorization_basic('fred', 'wilma');
#     ok($response = request($request), 'Request');
#     ok( $response->is_success, 'Response Successful 2xx' );
#     is( $response->content_type, 'application/json', 'Response Content-Type' );
#     like( $response->content, qr/CHEEEZ/, "contains translated string");

