#!/bin/bash -x
# batch process stuff
chmod 755 ~/Downloads/jsonschema2pojo-jsonschema2pojo-0.4.16/jsonschema2pojo-cli/target/jsonschema2pojo.sh
ln -s ~/Downloads/jsonschema2pojo-jsonschema2pojo-0.4.16/jsonschema2pojo-cli/target/jsonschema2pojo.sh .
 mkdir All
mkdir All2
mkdir X3D
brew install python
brew linkapps python
sudo easy_install pip
sudo pip install genson

cp -r www.web3d.org All2/.
find All2/ -type f -name "*.json" -print0 | xargs -0 node FindBad.js | xargs rm
./jsonschema2pojo.sh -303 -T JSON -t X3D/www.web3d.org/x3d/content/examples/ConformanceNist        -s All2/www.web3d.org/x3d/content/examples/ConformanceNist -p "x3djson"
./jsonschema2pojo.sh -303 -T JSON -t X3D/www.web3d.org/x3d/content/examples/Basic                  -s All2/www.web3d.org/x3d/content/examples/Basic -p "x3djson"
./jsonschema2pojo.sh -303 -T JSON -t X3D/www.web3d.org/x3d/content/examples/Savage                 -s All2/www.web3d.org/x3d/content/examples/Savage -p "x3djson"
./jsonschema2pojo.sh -303 -T JSON -t X3D/www.web3d.org/x3d/content/examples/Vrml2.0Sourcebook      -s All2/www.web3d.org/x3d/content/examples/Vrml2.0Sourcebook -p "x3djson"
./jsonschema2pojo.sh -303 -T JSON -t X3D/www.web3d.org/x3d/content/examples/X3dForWebAuthors       -s All2/www.web3d.org/x3d/content/examples/X3dForWebAuthors -p "x3djson"
./jsonschema2pojo.sh -303 -T JSON -t X3D/www.web3d.org/x3d/content/examples/X3dForAdvancedModeling -s All2/www.web3d.org/x3d/content/examples/X3dForAdvancedModeling -p "x3djson"
./jsonschema2pojo.sh -303 -T JSON -t X3D/www.web3d.org/x3d/content/examples/SavageDefense          -s All2/www.web3d.org/x3d/content/examples/SavageDefense -p "x3djson"

# write all javafiles to a file

find -X X3D -type f -name "*.java" > JavaFiles2

./scrub2.sh
