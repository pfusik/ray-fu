const level = process.argv.length == 3 ? parseInt(process.argv[2]) : 6;
const pgm = new Uint8Array(RayTracer.PGM_LENGTH);
RayTracer.render(pgm, level);
const fs = require("fs");
fs.writeFile("js.pgm", pgm, (err) => {
		if (err)
			throw err;
	});
