#!/usr/bin/perl

use strict;
use warnings;

use Test::More  tests => 5;
use lib '../lib';

use_ok('Kernel::Base');
use_ok('Kernel::Send');
use_ok('Kernel::Log');
use_ok('Kernel::Send');
use_ok('Kernel::Account');
