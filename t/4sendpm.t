#!/usr/bin/perl

use strict;
use warnings;
use lib '../lib';
use Data::Dumper;
use Kernel::Base;
use Test::More tests => 4;

my $m       = new Kernel::Message(path => '../var/message.txt');
my $account = new Kernel::Account;
my $send    = new Kernel::Send;

my $ua = new LWP::UserAgent;

my $login    = 'ultimaaop';
my $password = 'spam001';

is($account->check($login, $password), 1, 'Авторизация');
my $cookie_jar = $account->get_cookie;
is(ref $cookie_jar, 'HTTP::Cookies', 'Наличиие Cookie');
$ua->cookie_jar($cookie_jar);

my $response = $ua->get('http://www.faces.com/profile/' . $login);
ok($response->content =~ m,<dt>Name</dt><dd>$login</dd>,g,
    'Проверка в проффайле');

is($send->send($login, $cookie_jar, $m->random),
    1, 'Сообщение отправлено');
