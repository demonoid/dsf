#!/usr/bin/perl 

use warnings;
use strict;
use LWP::UserAgent;
use lib '../lib';
use Kernel::Base;
use Test::More tests => 3;

my $account  = new Kernel::Account;
my $login    = 'ultimaaop';
my $password = 'spam001';

is($account->check($login, $password), 1, 'Авторизация');
my $cookie_jar = $account->get_cookie;
is(ref $cookie_jar, 'HTTP::Cookies', 'Наличиие Cookie');

my $ua = new LWP::UserAgent;
$ua->cookie_jar($cookie_jar);
my $response = $ua->get('http://www.faces.com/profile/' . $login);
ok($response->content =~ m,<dt>Name</dt><dd>$login</dd>,g,
    'Проверка в проффайле');


