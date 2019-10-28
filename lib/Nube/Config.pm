package Nube::Config;

use strict;
use warnings;

use YAML::Tiny;
use File::HomeDir;

sub create {
    my ( $api_key, $config_path ) = @_;
    $config_path //= _default_path();

    die unless _is_valid($api_key);

    open( my $fh, '>', $config_path ) || die $!;
    print $fh "api_key: $api_key\n";
    close $fh || die $!;
}

sub load {
    my ($config_path) = @_;
    $config_path //= _default_path($config_path);

    if ( !_is_initialised($config_path) ) {
        die "Config file does not exist. Run the 'init' command to create one";
    }

    my $yaml   = YAML::Tiny->read($config_path);
    my $config = $yaml->[0];
    die unless _is_valid( $config->{api_key} );
    return $config;
}

sub _is_initialised {
    my ($config_path) = @_;

    return ( -s $config_path );
}

sub _is_valid {
    my ($api_key) = @_;
    return length($api_key) == 32;
}

sub _default_path {
    return File::HomeDir->my_home . '/.openweather.yml';
}

1;
