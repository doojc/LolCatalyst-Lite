use inc::Module::Install;

name     'CrashCourse-Point';
all_from 'lib/CrashCourse/Point.pm';
author   'Kieren <zarquon@cpan.org>';
license  'perl';

build_requires 'Test::More';
requires 'Moose';

auto_install;

WriteAll;

