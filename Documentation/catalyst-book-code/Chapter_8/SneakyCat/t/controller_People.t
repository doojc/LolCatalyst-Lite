use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'SneakyCat' }
BEGIN { use_ok 'SneakyCat::Controller::People' }

ok( request('/people')->is_success, 'Request should succeed' );


