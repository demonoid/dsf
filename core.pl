#!/usr/bin/perl -w
# Copyright (c) 2008, Rubalko Dmitriy

use strict;
use lib 'lib';
use Data::Dumper;
use base 'Kernel::Base';
use threads;

my $l = new Kernel::Log({path => 'log/faces.com.log'});
$l->info('Самое начало ..');

my $m = new Kernel::Message(path => 'var/message.txt');
my $a = new Kernel::Account;
my $s = new Kernel::Send;

print "Валид\n" if $a->check('ultimaaop', 'spam001');

my $cookie_jar = $a->get_cookie;

while (<>) {
    chomp;
    if ($s->send($_, $cookie_jar, $m->random)) {
        $l->info("Отнправлено : имя $_");
        print "Отправлено $_\n";
    } else {
        $l->error("Не отправлено : имя $_");
        print "ошибке =\\ \n";
    }
}
