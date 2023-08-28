CFLAGS = -O2 -Wall
CXXFLAGS = -std=c++2a -O2 -Wall
CSC = "C:/Program Files/Microsoft Visual Studio/2022/Community/MSBuild/Current/Bin/Roslyn/csc.exe"
PYTHON = python -B
SWIFTC = swiftc
ifeq ($(OS),Windows_NT)
SWIFTC += -no-color-diagnostics -Xlinker -noexp -Xlinker -noimplib
endif

c.pgm: c.exe
	time ./c.exe

cpp.pgm: cpp.exe
	time ./cpp.exe

cs.pgm: cs.exe
	time ./cs.exe

d.pgm: d.exe
	time ./d.exe

java.pgm: RayTracer.class Main.class
	time java Main

js.pgm: Main.mjs RayTracer.mjs
	time node $<

py.pgm: Main.py RayTracer.py
	time $(PYTHON) $<

swift.pgm: swift.exe
	time ./swift.exe

c.exe: RayTracer.c Main.c
	$(CC) $(CFLAGS) -o $@ $^ `pkg-config --cflags --libs glib-2.0`

cpp.exe: RayTracer.cpp Main.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

cs.exe: RayTracer.cs Main.cs
	$(CSC) -nologo -out:$@ $^

d.exe: RayTracer.d Main.d
	dmd -O -release -of$@ $^

%.class: %.java
	javac $<

swift.exe: RayTracer.swift main.swift
	$(SWIFTC) -o $@ $^

RayTracer.c RayTracer.cpp RayTracer.cs RayTracer.d RayTracer.java RayTracer.mjs RayTracer.py RayTracer.swift: RayTracer.fu
	fut -o $@ $^
