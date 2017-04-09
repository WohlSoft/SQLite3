TEMPLATE = lib
CONFIG  -= app_bundle
CONFIG  -= qt
CONFIG  -= dll
CONFIG  += staticlib

!win*-msvc*:{
    QMAKE_CFLAGS_WARN_ON += -Wno-unused-parameter -Wno-missing-field-initializers
}

TARGET=sqlite3

SOURCES += \
    $$PWD/src-amalgamation/sqlite3.c

DEFINES += \
    SQLITE_THREADSAFE=2 \
    SQLITE_ENABLE_RTREE \
    SQLITE_ENABLE_FTS5 \
    SQLITE_ENABLE_DBSTAT_VTAB \
    SQLITE_ENABLE_JSON1 \


