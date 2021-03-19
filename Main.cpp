#include <cstdint>
#include <cstdio>
#include <cstdlib>

#include "RayTracer.hpp"

int main(int argc, char **argv)
{
	int level = argc == 2 ? std::atoi(argv[1]) : 6;
	uint8_t pgm[RayTracer::pgmLength];
	RayTracer::render(pgm, level);
	FILE *fp = std::fopen("cpp.pgm", "wb");
	std::fwrite(pgm, 1, RayTracer::pgmLength, fp);
	std::fclose(fp);
}
