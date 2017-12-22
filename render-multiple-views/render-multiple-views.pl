#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig;
use Math::Trig ':pi';

my $model = "dice2.dae";

my $count = 12;
my $r = 4;

my $w = 400;
my $h = 400;

my $cam_x = 0;
my $cam_y = 1;
my $cam_z = -4;

my $center_x = 0;
my $center_y = 1;
my $center_z = 0;

my $up_x = 0;
my $up_y = 1;
my $up_z = 0;

my $fovy = 45;

for (my $i = 0; $i < $count; $i++) {
	my $a = (pi2 / $count) * $i;
        $cam_x = $r * sin($a);
        $cam_z = $r * cos($a);
	my $name = $model . "_" . sprintf("%03s", $i + 1) . ".png";

	print $name;
#        print " - ";
	
#	my $x = $r * cos($a );
#	my $z = $r * sin($a );
#        print $a;
#        print " - ";
#	print $i;
#	print " - ";
#	print $cam_x;
#	print " - ";
#	print $cam_z;
#	my $command = join (" ", "render", $model, $name, $w, $h, $cam_x, $cam_y, $cam_z, $center_x, $center_y, $center_z, $up_x, $up_y, $up_z, $fovy);
#	print " - ";
#	print $command;
#	print "\n";
	`render $model $name $w $h $cam_x $cam_y $cam_z $center_x $center_y $center_z $up_x $up_y $up_z $fovy`;	
}

#print pi2

#`render dice2.dae dice2.dae.png 400 400 0 1 -4 0 1 0 0 1 0 45`;

