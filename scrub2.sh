#!/bin/bash
mkdir Merged2
grep "[A-Za-z0-9].java$" JavaFiles2| xargs ./pc2
for i in Merged2/*java
do
	file=`basename "$i" .java`
	cp `grep "^X3D.*"/$file"_*\.java$" JavaFiles2 | xargs wc -w | sort -nr | cut -d ' ' -f 6 -f 7 | cut -d ' ' -f 2 | ./firstline.pl` Merged2/$file.java || echo "$i"
done
./recompile2.sh
