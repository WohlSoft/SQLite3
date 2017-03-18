
include_directories (${CMAKE_SOURCE_DIR}/test
                     ${CMAKE_SOURCE_DIR}/src-amalgamation
                    )

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/test/bin )

add_executable (sqlite_demo
                sqlite_demo.c
                )

LINK_DIRECTORIES(${CMAKE_SOURCE_DIR})
TARGET_LINK_LIBRARIES(sqlite_demo sqlite3 pthread dl m)

set_target_properties(sqlite_demo PROPERTIES COMPILE_DEFINITIONS "GSL_THROW_ON_CONTRACT_VIOLATION")

add_test (NAME sqlite_demo WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/build/test/bin COMMAND sqlite_demo)

