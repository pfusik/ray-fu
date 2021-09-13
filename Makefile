CFLAGS = -O2 -Wall
CXXFLAGS = -std=c++2a -O2 -Wall
CSC = "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin/Roslyn/csc.exe"
SWIFTC = swiftc
ifeq ($(OS),Windows_NT)
SWIFTC += -no-color-diagnostics -sdk '$(SDKROOT)'
endif

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

swift.pgm: swift.exe
	time ./swift.exe

c.exe: RayTracer.c Main.c
	$(CC) $(CFLAGS) -o $@ $^ `pkg-config --cflags --libs glib-2.0`

cpp.exe: RayTracer.cpp Main.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

js.js: RayTracer.js Main.js
	cat $^ > $@

cs.exe: RayTracer.cs Main.cs
	$(CSC) -nologo -out:$@ $^

%.class: %.java
	javac $<

swift.exe: RayTracer.swift main.swift
	$(SWIFTC) -o $@ $^

RayTracer.c RayTracer.cpp RayTracer.cs RayTracer.java RayTracer.js RayTracer.py RayTracer.swift: RayTracer.ci
	cito -o $@ $^
