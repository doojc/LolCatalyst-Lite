use inc::Module::Install;

name     'Greeter';
all_from 'lib/Greeter.pm';
author   'Me <you@example.com>';
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

