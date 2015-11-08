#!/bin/bash
mkdir Merged
grep "[A-Za-z0-9].java$" JavaFiles1 | xargs ./pc
for i in Merged/*java
do
	file=`basename "$i" .java`
	cp `grep "^All.*"/$file"_*\.java$" JavaFiles1 | xargs wc -w | sort -nr | cut -d ' ' -f 6 -f 7 | cut -d ' ' -f 2 | ./firstline.pl` Merged/$file.java || echo "$i"
done
./recompile.sh
