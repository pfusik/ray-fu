cs.pgm: cs.exe
	time ./cs.exe

cs.exe: RayTracer.cs Main.cs
	"C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin/Roslyn/csc.exe" -nologo -out:$@ $^

RayTracer.cs: RayTracer.ci
	cito -o $@ $^
