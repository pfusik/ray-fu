CFLAGS = -O2 -Wall
CXXFLAGS = -std=c++2a -O2 -Wall

c.pgm: c.exe
	time ./c.exe

cpp.pgm: cpp.exe
	time ./cpp.exe

cs.pgm: cs.exe
	time ./cs.exe

java.pgm: RayTracer.class Main.class
	time java Main

js.pgm: js.js
	time node $<

py.pgm: Main.py RayTracer.py
	time python $<

c.exe: RayTracer.c Main.c
	$(CC) $(CFLAGS) -o $@ $^ `pkg-config --cflags --libs glib-2.0`

cpp.exe: RayTracer.cpp Main.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

js.js: RayTracer.js Main.js
	cat $^ > $@

cs.exe: RayTracer.cs Main.cs
	"C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin/Roslyn/csc.exe" -nologo -out:$@ $^

%.class: %.java
	javac $<

RayTracer.c RayTracer.cpp RayTracer.cs RayTracer.java RayTracer.js RayTracer.py: RayTracer.ci
	cito -o $@ $^
