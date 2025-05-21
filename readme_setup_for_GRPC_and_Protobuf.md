# Protobuf and gRPC Build Instructions



This guide outlines the steps to build and install **Protocol Buffers (Protobuf)** version 21.12 and **gRPC** version 1.65.1 on Windows using **Visual Studio 2022** (x64, Release mode) without SSL or OpenSSL dependencies.

## Pre-requisite

- **IDE**: Visual Studio 2022
- **C++ Standard : C++17
- **Architecture**: x64
- **Build Type**: Release
- **Protobuf Version**: 21.12 (libprotoc 3.21.12)
- **gRPC Version**: v1.65.1



************************* PROTOCOL BUFFER SETUP AND INSTALLATION *************************

## Step 1: Build Protocol Buffers

## Clone Protobuf

git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf
git checkout v21.12
git submodule update --init --recursive


## Build Protobuf
Create and navigate to the build directory:


mkdir build
cd build

## Generate the solution file for Protobuf

cmake .. -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_MSVC_STATIC_RUNTIME=OFF -DCMAKE_CXX_STANDARD=17 

## Verify Protobuf version

protoc --version 
output - protoc --version  # Should output: libprotoc 3.21.12

## Build the solution for Protobuf

 Option 1: Command line

   cmake --build . --config Release
   
 Option 2: Visual Studio - Administrator mode 
 
	Open protobuf.sln in Visual Studio 2022.
	Set the build target to ALL_BUILD (x64, Release mode).
	Build the solution.
	
## Install Protobuf :

 Option 1: Command line
 
    cmake --install
	
 Option 2: Visual Studio - admin mode

	In Visual Studio, right-click the INSTALL component in Solution Explorer and build it.
	This installs to C:\Program Files\protobuf  --- (adjust paths in later steps if installed).
	
## Output
	protoc.exe: C:\protobuf\build\Release\protoc.exe

	Library: C:\protobuf\build\Release\libprotobuf.lib

	Headers: C:\protobuf\src


************************* GRPC SETUP AND INSTALLATION *************************

### Build gRPC

Clone gRPC

	git clone https://github.com/grpc/grpc.git
	cd grpc
	git checkout v1.65.1
	git submodule update --init --recursive

### Build gRPC
 Create and navigate to the build directory:

	mkdir build
	cd build
	
### Generate the solution file (grpc.sln) :

    cmake .. -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=17 -DCMAKE_INSTALL_PREFIX=C:/grpc  -DgRPC_INSTALL=ON -DgRPC_BUILD_TESTS=OFF   -DgRPC_PROTOBUF_PROVIDER=package -DProtobuf_ROOT=C:/protobuf -DgRPC_SSL_PROVIDER=none -DgRPC_BORINGSSL_PROVIDER=none -DgRPC_ZLIB_PROVIDER=package -DgRPC_CARES_PROVIDER=package -DgRPC_RE2_PROVIDER=package -DgRPC_ABSL_PROVIDER=package -DgRPC_BUILD_GRPCPP_CHANNELZ=OFF -DgRPC_BUILD_CSHARP_EXT=OFF -DgRPC_BUILD_GRPCPP_AUTH=OFF -DgRPC_BUILD_GRPCPP_ALTS=OFF -DgRPC_BUILD_GRPCPP_SSL=OFF

    Note : Note: SSL dependencies are disabled using -DgRPC_SSL_PROVIDER=none and -DgRPC_BORINGSSL_PROVIDER=none.

### Build the solution:
   
   Open Visual Studio 2022 in Administrator mode.

	Open grpc.sln in Visual Studio 2022.
	Set the build target to ALL_BUILD (x64, Release mode).
	Build the solution.

### Installation:

	In Visual Studio, right-click the INSTALL component in Solution Explorer and build it.
	This installs to C:\Program Files\grpc  --- (adjust paths in later steps if installed)..

Notes: 
Ensure Visual Studio 2022 is installed with the C++ development workload.

Paths (C:/protobuf, C:/grpc, etc.) may need adjustment based on your system setup.

If you encounter issues, verify that all dependencies are correctly referenced and that the build environment is clean.















