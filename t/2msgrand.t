#!/usr/bin/perl 

use strict;
use warnings;
use lib '../lib';
use Kernel::Base;
use Test::More tests => 6;
use Data::Dumper;

my $test_data = '[ SUBJECT = "Hello check" 
MESSAGE = "check this <%URL= http://r0.ru?id=11 %>" ]

[ SUBJECT = "please lock" 
MESSAGE= "check <%URL=http://r0.ru?id=11 %>" ]

[ SUBJECT = "Wow" 
MESSAGE = "very nice viagra <%URL = http://r0.ru?id=11 %>" ]';

is(open(F => '>>', 'test2'), 1, 'Создаём временный файл');

print F $test_data;
is(close(F), 1, 'Закрываем временный файл');

my $m = new Kernel::Message(path => 'test2');

ok($m->random->{message} =~ m[<a href="http://r0\.ru],
    'Случайный текст 0');
ok($m->random->{message} =~ m[<a href="http://r0\.ru],
    'Случайный текст 1');

is(unlink('test2'), 1, 'Удаляем временный файл');

undef $m;

my $n = new Kernel::Message(
    const_message => {
        subject => 'Hello check',
        message => 'MESSAGE = "very nice viagra <%URL = http://r0.ru?id=11 %>'
    }
);

ok( $n->get->{message} =~ m[<a href="http://r0\.ru],
    'Проверка сообщения(контанта)'
);
