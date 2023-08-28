import std.conv;
import std.file;

import RayTracer : RayTracer;

void main(string[] args)
{
	int level = args.length == 2 ? args[1].to!int : 6;
	ubyte[RayTracer.pgmLength] pgm;
	RayTracer.render(pgm, level);
	write("d.pgm", pgm);
}
