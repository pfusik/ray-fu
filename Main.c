#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "RayTracer.h"

int main(int argc, char **argv)
{
	int level = argc == 2 ? atoi(argv[1]) : 6;
	uint8_t pgm[RayTracer_PGM_LENGTH];
	RayTracer_Render(pgm, level);
	FILE *fp = fopen("c.pgm", "wb");
	if (fp == NULL)
		return 1;
	fwrite(pgm, 1, RayTracer_PGM_LENGTH, fp);
	fclose(fp);
	return 0;
}
