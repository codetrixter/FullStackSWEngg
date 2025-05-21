# Bookstore gRPC Project

This is a simple bookstore application built using gRPC in C++ with Visual Studio 2022 (x64). It demonstrates a client-server architecture where the server manages a book inventory, and the client can add books and list all books. The project uses Protocol Buffers for service definitions and CMake for build automation.

## Features
- **gRPC Server**: Hosts a bookstore service to manage a list of books in memory.
- **gRPC Client**: Interacts with the server to add a book and list all books.
- **Protocol Buffers**: Defines the `Bookstore` service in `bookstore.proto`.
- **CMake Build**: Automates the generation of gRPC and Protobuf code and builds the project.

## Project Structure

BookstoreProject/
├── proto/
│   └── bookstore.proto        # Protobuf service definition
├── src/
│   ├── server.cpp            # gRPC server implementation
│   ├── client.cpp            # gRPC client implementation
│   ├── bookstore.h           # Book data structure
├── CMakeLists.txt            # CMake build configuration
├── README.md                 # Project documentation



## Prerequisites
- **Visual Studio 2022**: Install with the C++ development workload.
- **package**: Package manager for installing gRPC, Protobuf, and Abseil (if already installed then take the binaries and use it).
- **CMake**: Version 3.10 or higher for build automation.
- **Git**: For cloning vcpkg (optional if already installed).

## Setup Instructions
### 1. Install protocol buffer and grpc version 
1. protoc version: (v21.12)
   libprotoc 3.21.12
   
2. grpc version:
   grpc 1.65.1
   
### Dependencies Required to Build the Project:

	## Project Properties Configuration

		#  C/C++ -> General -> Additional Include Directories 		
  
			create one build directory at project location : mkdir build
			Add the following paths:
				C:\protobuf\include
				C:\grpc\include
				<project_location_path>\build (e.g., C:\GRPC_BOOKSTORE_PROJECT\build)

		#  Linker -> General -> Additional Library Directories

			Add the following path:
			C:\grpc\lib
		
		#  Linker -> Input -> Additional Dependencies

			 Add the following library files (ensure these are available in C:\grpc\lib and C:\protobuf\lib). 
			 You can verify the library names by running "getfilename.bat" in the C:\grpc\lib directory and updating as needed.
			 

### Build Instructions

	## Clone or Set Up the Project:
	
		mkdir build
		cd build
		cmake -G "Visual Studio 17 2022" -A x64
		
	## Build the Project:

		Open BookstoreProject.sln in Visual Studio 2022.

		Select the Release configuration for x64. (as of now for release mode only because our grpc and protobuf lib built it on release mode)

		Set the project properties as described in the "Dependencies Required to Build the Project" section.

### Running the Application

    .\build\Release\bookstore_server.exe - The server will listen on 0.0.0.0:50051

    .\build\Release\bookstore_client.exe - Outputs the added book's ID and lists all books.
	   Ex - Added book with ID: 1
			ID: 1, Title: The Great Bangalore, Author: Arpit Sharma


	







  
