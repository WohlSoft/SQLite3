@echo off
mkdir build-msvc2017
cd build-msvc2017
cmake ../. -G "Visual Studio 15"
