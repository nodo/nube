package Nube::Config;

use strict;
use warnings;

use YAML::Tiny;
use File::HomeDir;

sub create {
    my ( $self, $api_key, $config_path ) = @_;
    $config_path //= _default_path();

    open( my $fh, '>', $config_path ) || die $!;
    print $fh "api_key: $api_key\n";
    close $fh || die $!;
}

sub load {
    my ( $self, $config_path ) = @_;
    $config_path //= _default_path();

    my $yaml = YAML::Tiny->read($config_path);
    return $yaml->[0];
}

sub is_initialised {
    my ( $self, $config_path ) = @_;
    $config_path //= _default_path();

    return ( -s $config_path );
}

sub _default_path {
    return File::HomeDir->my_home . '/.openweather.yml';
}

1;
