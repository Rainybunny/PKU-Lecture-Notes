CMAKE_MINIMUM_REQUIRED(VERSION 3.22)
project (tensor LANGUAGES CUDA CXX C)

add_subdirectory(pybind11)
pybind11_add_module(mytensor
    src/pybind.cpp
    src/tensor.cu
    src/cudabase.cu
    src/functional.cu
)

set (CMAKE_CXX_STANDARD 20)
set (CMAKE_POSITION_INDEPENDENT_CODE ON)
set (CMAKE_CUDA_STANDARD 20)

set (CMAKE_CXX_COMPILER g++)
set (CMAKE_CUDA_COMPILER nvcc)

find_package(CUDA REQUIRED)
include_directories(${CUDA_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR})
target_link_libraries(mytensor PRIVATE ${CUDA_LIBRARIES} cublas curand)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
	message("Debug build")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -DSHAPE_CHECK")
	set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -g -DSHAPE_CHECK")
else()
	message("Release build")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
	set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -O3")
endif()
