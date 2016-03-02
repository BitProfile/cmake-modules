if(NOT __COMPILER_FLAGS_SET__)
    set(__COMPILER_FLAGS_SET__ 1)
    if (WIN32 OR MSVC)
        add_definitions(-D__WINDOWS_OS__)
        if(MSVC)
                add_compile_options(/MP /EHsc /W1 -D_WIN32_WINNT=0x0600 /DNOMINMAX)
                set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS} /ignore:4221")
                set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /ignore:4099,4075 /STACK:16777216")
        endif()
    elseif(APPLE)
        add_definitions(-D__APPLE_OS__)
    elseif(UNIX)
        add_definitions(-D__LINUX_OS__)
        add_definitions ("-Wall")
    endif()
endif()