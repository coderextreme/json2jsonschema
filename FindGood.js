// FindErrors.js  Report files which don't parse properly

var fs = require('fs');

for (i in process.argv) {
	if (i < 2) {
		continue;
	}
	var file = process.argv[i];
        data = fs.readFileSync(file, "utf8");
	try {
		JSON.parse(data);
		console.log(file);
	} catch (e) {
		console.error(e);
	}
}
