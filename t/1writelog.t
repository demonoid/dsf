#!/usr/bin/perl 

use strict;
use warnings;

use Test::More tests => 5;
use lib '../lib';
use Kernel::Base;

my $log = new Kernel::Log({path => 'myfile.log'});
$log->error('Test 0');
$log->info('Test 1');
$log->debug('Test 2');

ok(-e 'myfile.log', 'Файл создан');
ok(open(F => 'myfile.log'), 'Файл открыт');
{
    local $/ = undef;
    my $data = <F>;
    ok($data =~ /Test \d+/g, 'Файл содержит записи');
}
ok(close F,              'Файл закрыт');
ok(unlink('myfile.log'), 'Файл удалён');
