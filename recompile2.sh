#!/bin/bash -x
export CLASSPATH=`ls -d $PWD/lib/*jar $PWD | tr '\n\r' ::`
rm Merged2/Float.java
mv Merged2/Movietexture.java Merged2/MovieTexture.java
cp X3D/www.web3d.org/x3d/content/examples/Savage/x3djson/Scenarios/CollisionUssGreenevilleMvEhimeMaru/FieldStopTimeChanged.java Merged2
find Merged2 -name '*.java' > JavaFiles4
cat JavaFiles4 | xargs perl -p -i -e 's/([A-Za-z0-9])_+([^A-Za-z0-9])/$1$2/g'
cat JavaFiles4 | xargs perl -p -i -e 's/package x3djson.*;/package x3djson;/g'
cat JavaFiles4 | xargs perl -p -i -e 's/x3djson[A-Za-z0-9_.]*\.([A-Za-z0-9_]*)/x3djson.$1/g'
# find Merged2 -name '*.java' | xargs perl -p -i -e 's/Float/float/g'
diff Merged2/ ../x3djson/x3djson/|grep "Only in \."|more | sed -e 's/Only in //'|sed 's/: //'| xargs -L0 -I % cp % Merged2/
find Merged2 -name '*.java' | xargs javac
./schemagen.sh
