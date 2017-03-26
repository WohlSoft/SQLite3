
include_directories (${CMAKE_SOURCE_DIR}/test
                     ${CMAKE_SOURCE_DIR}/src-amalgamation
                    )

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/test/bin )

add_executable (sqlite_demo
                sqlite_demo.c
                )

# Set up dependencies
add_dependencies(sqlite_demo sqlite3)
LINK_DIRECTORIES(${CMAKE_SOURCE_DIR})
    TARGET_LINK_LIBRARIES(sqlite_demo sqlite3)
if(NOT MSVC)
    TARGET_LINK_LIBRARIES(sqlite_demo sqlite3 pthread dl m)
endif()

add_test (NAME sqlite_demo WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin/$<CONFIG> COMMAND sqlite_demo)
