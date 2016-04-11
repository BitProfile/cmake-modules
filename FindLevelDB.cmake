include(FindPackageHandleStandardArgs)

if (LEVELDB_INCLUDE_DIR AND LEVELDB_LIBRARIES)
    set(LevelDB_FIND_QUIETLY TRUE)

else  (LEVELDB_INCLUDE_DIR AND LEVELDB_LIBRARIES)
    set(LevelDB_FIND_QUIETLY FALSE)

    find_path(LEVELDB_INCLUDE_DIR NAMES leveldb/db.h)
    find_library(LEVELDB_LIBRARY leveldb)

    find_library(SNAPPY_LIBRARY snappy)
    find_path(SNAPPY_INCLUDE_DIR snappy.h PATH_SUFFIXES snappy)

    if(SNAPPY_LIBRARY)
        set(LEVELDB_LIBRARIES ${LEVELDB_LIBRARY} ${SNAPPY_LIBRARY})
    else()
        set(LEVELDB_LIBRARIES ${LEVELDB_LIBRARY})
    endif()

endif  (LEVELDB_INCLUDE_DIR AND LEVELDB_LIBRARIES)

message("leveldblibraries ${LEVELDB_LIBRARIES}")

FIND_PACKAGE_HANDLE_STANDARD_ARGS(LevelDB DEFAULT_MSG LEVELDB_INCLUDE_DIR LEVELDB_LIBRARIES)
mark_as_advanced (LEVELDB_INCLUDE_DIR LEVELDB_LIBRARIES)

