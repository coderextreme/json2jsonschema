# json2jsonschema
My experiments converting JSON to JSON schema (minus external dependences

You need a www.web3d.org folder, which you can get by

Requirements 

* jsonschema2pojo 0.4.16
	* maven
* GenSON
	* python

```
unzip X3dExampleArchivesJsonScenes.zip
```

Then run

```
./examples2.sh  # produces schema.json from www.web3d.org JSON files
```
```
./createmerge.sh # produces x3dmerge.json from www.web3d.org JSON files
```
```
./final.sh # produces X3DMERGE Java files from www.web3d.org JSON files
```
```
./generate.sh # produces X3DALL Java files from wwww.web3d.org JSON files
```

TODO
```
./genschemas.sh  # produces 7 Java Schema files from www.web3d JSON files
```
```
./examples.sh
```
