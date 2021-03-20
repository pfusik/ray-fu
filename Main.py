from RayTracer import RayTracer
import sys

level = int(sys.argv[1]) if len(sys.argv) == 2 else 6
pgm = bytearray(RayTracer.PGM_LENGTH)
RayTracer.render(pgm, level)
with open("py.pgm", "wb") as f: f.write(pgm)
