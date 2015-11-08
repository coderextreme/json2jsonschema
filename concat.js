var fs = require('fs');

console.log('[');
for (i in process.argv) {
	if (i < 2) {
		continue;
	}
	var file = process.argv[i];
	var data = fs.readFileSync(file);
	try {
		var json = JSON.parse(data)[0];
		if (typeof json !== 'undefined') {
			console.log(JSON.stringify(json));
			if (i >= 2 && i < process.argv.length-1) {
				console.log(',');
			}
		} else {
			console.error('undefined', file);
		}
	} catch (e) {
		console.error(e, file);
	}
}
console.log(']');
