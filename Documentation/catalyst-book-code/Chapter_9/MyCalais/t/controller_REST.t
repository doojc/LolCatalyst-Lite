 use strict;
 use warnings;
 use Test::More qw/no_plan/;

 BEGIN { use_ok 'Catalyst::Test', 'MyCalais' }
 BEGIN { use_ok 'MyCalais::Controller::REST' }

 use HTTP::Request::Common qw/GET POST PUT DELETE/;
 use JSON::Any;
 my $j = JSON::Any->new;

 my $resp;

   diag 'Add a resource';
   my $req_data = { url => 'http://dev.catalystframework.org/snow_white'};
   $resp = request( PUT '/rest', 'Content-Type' => 'application/json',
                    Content => $j->objToJson($req_data) );
   diag $resp->status_line;
   diag $resp->content;

 use URI::Escape;
 diag 'Retrieve a resource';
 my $uri = uri_escape('http://dev.catalystframework.org/snow_white');
 my $path = "/rest/$uri";
 $resp = request( GET $path , 'Content-Type' => 'application/json');
 diag $resp->status_line;
 diag $resp->content;

 diag 'Delete a resource';
 $resp = request( DELETE $path, 'Content-Type' => 'application/json');
 diag $resp->status_line;
 diag $resp->content;
