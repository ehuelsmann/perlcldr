#!/usr/bin/perl
# Do not normalise this test file. It has deliberately unnormalised characters in it.
use v5.10;
use strict;
use warnings;
use utf8;
use if $^V ge v5.12.0, feature => 'unicode_strings';

use Test::More tests => 2;
use ok 'Locale::CLDR';

my $locale = Locale::CLDR->new('bg');

is_deeply($locale->installed_locales, [qw(Bg Bg_und_Bg En En_und_Us)], 'Installed Locales');