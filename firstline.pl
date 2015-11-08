#!/usr/bin/perl
while (<STDIN>) {
	chomp;
	if ($_ eq '') {
		next;
	} elsif ($_ eq 'total') {
		next;
	} else {
		print "$_\n";
		last;
	}
}
