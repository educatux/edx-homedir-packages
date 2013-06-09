#!/usr/bin/perl -w
use strict;
use IO::Socket;

my $weechat_icon='/home/jimshoe/scripts/libnotify-over-ssh/weechat_icon.png';
my $HOST = '127.0.0.1';
my $PORT = '1216';


my $socket = IO::Socket::INET->new('LocalPort' => $PORT,
    'Proto' => 'tcp',
    'Listen' => 4)
or die "Can't create socket ($!)\n";
while (my $client = $socket->accept) {
  my ($tag, $title, $summary,$x);
  while (<$client>) {
    my $buf = $_;
    chomp $buf;
    $x++;
    if($x == 1){$tag = $buf;}
    if($x == 2){$title = $buf;}
    if($x == 3){
      $summary = $buf;
      message($tag,$title,$summary);
    }
  }
  close $client
    or die "Can't close ($!)\n";
}

sub message{
  my $tag = $_[0];
  my $title = $_[1];
  my $summary = $_[2];
  if($tag eq 'mcabber'){
    $title =~ s/[<&]//g; # remove some characters that libnotify hates
    $summary =~ s/[<&]//g;
    my @args = ('/usr/bin/notify-send', "--icon=/usr/share/pixmaps/gnome-cromagnon.png" , $title, $summary);
    system @args;
    }
  if($tag eq 'system'){
    $title =~ s/[<&]//g; # remove some characters that libnotify hates
    $summary =~ s/[<&]//g;
    my @args = ('/usr/bin/notify-send', $title, $summary);
    system @args;
  }
}
