
cmake_minimum_required(VERSION 3.2)

####### ADD PREDEFINED DEFINITIONS:
set(SQLITE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(SQLITE_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src-amalgamation/)

####### SET POSTFIX:
set(CMAKE_DEBUG_POSTFIX             "d")
set(CMAKE_RELEASE_POSTFIX           "")
set(CMAKE_RELWITHDEBINFO_POSTFIX    "")
set(CMAKE_MINSIZEREL_POSTFIX        "")

####### FREEIMAGE
project(sqlite3 C)

add_definitions("-DSQLITE_ENABLE_RTREE")
add_definitions("-DSQLITE_ENABLE_FTS5")
add_definitions("-DSQLITE_ENABLE_DBSTAT_VTAB")
add_definitions("-DSQLITE_ENABLE_JSON1")
add_definitions("-DSQLITE_THREADSAFE=2 ")
# add_definitions("-DSQLITE_CONFIG_SERIALIZED")

if(APPLE)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-deprecated-declarations")
endif()

####### SOURCE CODE
set(SQLITE_SRC ${CMAKE_CURRENT_SOURCE_DIR}
	src-amalgamation/sqlite3.c
)

add_library(sqlite3 STATIC ${SQLITE_SRC})

####### PUBLIC HEADER
file(GLOB sqlite3_headers ${SQLITE_SRC_DIR}/sqlite3.h)
install(FILES ${sqlite3_headers} DESTINATION include)

install(TARGETS sqlite3
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin
)

option(SQLITE_ENABLE_TESTING "Enables a building of unit test utility" OFF)
if(SQLITE_ENABLE_TESTING)
	# Enable Testing
	enable_testing ()
	# Add test
	add_subdirectory (test)
endif()
