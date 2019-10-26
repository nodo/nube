#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Test::MockModule;

use_ok('Nube::Openweather');

{

    package MockResponse;

    sub new {
        my $class = shift;
        my $self  = {};
        bless $self, $class;
        return $self;
    }
    sub is_success() { 1 }

    sub decoded_content() {
        '{ "weather": [ { "description": "tropical sun" } ]}';
    }
}

{

    package MockRequest;

    sub new {
        my $class = shift;
        my $self  = {};
        bless $self, $class;
        return $self;
    }

    sub request() {
        return MockResponse->new();
    }

}

my $module = Test::MockModule->new('LWP::UserAgent');
$module->mock(
    'new',
    sub {
        return MockRequest->new();
    }
);

my $got = Nube::OpenWeather::get( "test-key", "test-city" );
is( ref($got),                           'HASH',         "Querying openweather returns a hash reference" );
is( $got->{weather}->[0]->{description}, 'tropical sun', "The description matches the expectation" );

done_testing();
