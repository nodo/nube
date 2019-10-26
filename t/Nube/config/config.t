#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

use_ok('Nube::Config');

my $config = Nube::Config::load("t/Nube/data/valid_config.yml");

my @expected_keys = ('api_key');
for my $key (@expected_keys) {
    ok( $config->{$key}, "config has property '$key'" );
}

ok( !Nube::Config::is_initialised("/tmp/non_existent.txt") );
ok( Nube::Config::is_initialised("t/Nube/data/valid_config.yml") );

dies_ok {
    Nube::Config::load("t/Nube/data/invalid_config.yml")
}
'expecting loading an invalid config to fail';

dies_ok {
    Nube::Config::create( "invalid", "/tmp/doesntmatter.txt" )
}
'expecting creating config with an invalid api_key to fail';

done_testing();
