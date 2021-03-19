CXXFLAGS = -std=c++2a -O2 -Wall

java.pgm: RayTracer.class Main.class
	time java Main

cpp.pgm: cpp.exe
	time ./cpp.exe

cs.pgm: cs.exe
	time ./cs.exe

cpp.exe: RayTracer.cpp Main.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

cs.exe: RayTracer.cs Main.cs
	"C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin/Roslyn/csc.exe" -nologo -out:$@ $^

%.class: %.java
	javac $<

RayTracer.cpp RayTracer.cs RayTracer.java: RayTracer.ci
	cito -o $@ $^
