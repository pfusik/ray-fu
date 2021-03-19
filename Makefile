CXXFLAGS = -std=c++2a -O2 -Wall

js.pgm: js.js
	time node $<

cpp.pgm: cpp.exe
	time ./cpp.exe

cs.pgm: cs.exe
	time ./cs.exe

java.pgm: RayTracer.class Main.class
	time java Main

cpp.exe: RayTracer.cpp Main.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

js.js: RayTracer.js Main.js
	cat $^ > $@

cs.exe: RayTracer.cs Main.cs
	"C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin/Roslyn/csc.exe" -nologo -out:$@ $^

%.class: %.java
	javac $<

RayTracer.cpp RayTracer.cs RayTracer.java RayTracer.js: RayTracer.ci
	cito -o $@ $^
