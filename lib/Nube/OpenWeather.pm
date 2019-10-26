package Nube::OpenWeather;

use strict;
use warnings;

use HTTP::Request;
use LWP::UserAgent;
use JSON 'decode_json';

sub get {
    my ( $api_key, $city ) = @_;
    $city //= 'Amsterdam';

    my $url      = _build_url( $api_key, $city );
    my $request  = HTTP::Request->new( GET => $url );
    my $ua       = LWP::UserAgent->new();
    my $response = $ua->request($request);

    return unless $response->is_success;
    return decode_json( $response->decoded_content );
}

sub _build_url {
    my ( $api_key, $city ) = @_;

    return "http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$api_key";
}

1;
