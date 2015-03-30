#!/usr/bin/perl
# Do not normalise this test file. It has deliberately unnormalised characters in it.
use v5.10;
use strict;
use warnings;
use utf8;
use if $^V ge v5.12.0, feature => 'unicode_strings';

use Test::More tests => 21;
use Test::Exception;

use ok 'Locale::CLDR';

my $locale = Locale::CLDR->new('ca');
is ($locale->locale_name('fr'), 'francès', 'Name without territory');
is ($locale->locale_name('fr_CA'), 'francès canadenc', 'Name with known territory') ;
is ($locale->locale_name('fr_BE'), 'francès (Bèlgica)', 'Name with unknown territory') ;
is ($locale->locale_name('fr_BE'), 'francès (Bèlgica)', 'Cached method') ;
is ($locale->language_name, 'català', 'Language name');
is ($locale->language_name('wibble'), 'idioma desconegut', 'Unknown Language name');
is ($locale->script_name('Cher'), 'cherokee', 'Script name');
is ($locale->script_name('wibl'), 'escriptura desconeguda', 'Invalid Script name');
is ($locale->territory_name('GB'), 'Regne Unit', 'Territory name');
is ($locale->territory_name('wibble'), 'Regió desconeguda', 'Invalid Territory name');
is ($locale->variant_name('AREVMDA'), 'armeni occidental', 'Variant name');
throws_ok { $locale->variant_name('WIBBLE') } qr{ \A Invalid \s variant }xms, 'Invalid Variant name';
is ($locale->language_name('i_klingon'), 'klingonià', 'Language alias');
is ($locale->territory_name('BQ'), 'Carib Neerlandès', 'Territory alias');
is ($locale->territory_name('830'), 'Regió desconeguda', 'Territory alias');
is ($locale->variant_name('BOKMAL'), '', 'Variant alias');
is ($locale->key_name('ca'), 'calendari', 'Key name');
is ($locale->key_name('calendar'), 'calendari', 'Key name');
is ($locale->type_name('ca', 'gregorian'), 'calendari gregorià', 'Type name');
is ($locale->type_name('calendar', 'gregorian'), 'calendari gregorià', 'Type name');