cmake_minimum_required(VERSION 2.8.12)

project(logfps)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(CURL 7.81.0 REQUIRED)
find_package(Boost REQUIRED COMPONENTS thread system date_time chrono regex)
find_package(yaml-cpp REQUIRED)

set(BOOST_LIBS ${Boost_THREAD_LIBRARY}
        ${Boost_SYSTEM_LIBRARY}
        ${Boost_DATE_TIME_LIBRARY}
        ${Boost_CHRONO_LIBRARY})

add_executable(logfps
	src/LogFPS.cpp
	)


target_include_directories(
	logfps PRIVATE
	${CURL_INCLUDE_DIRS}
	)

target_link_libraries(
	logfps
	${CURL_LIBRARIES}
	)

link_directories(${Boost_LIBRARY_DIRS})
