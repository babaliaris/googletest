project "googletest"
    kind "StaticLib"
    language "C++"
    cppdialect "c++17"
    targetdir "%{_WORKING_DIR}/builds/%{cfg.shortname}/"
    objdir "%{_WORKING_DIR}/obj/%{prj.name}_%{cfg.shortname}/"

    files {
        "src/**.h",
        "src/**.cc",
        "include/**.h"
    }

    includedirs {
        ".",
        "include/",

    }


    -- -------------------------------|All Platforms|------------------------------- --
    filter{}
    filter "configurations:debug"
        defines "DEBUG"
        runtime "Debug"
        symbols "on"

    filter{}
    filter "configurations:dist"
        defines "NDEBUG"
        runtime "Release"
        optimize "on"

    filter{}
    filter "configurations:release"
        defines "NDEBUG"
        runtime "Release"
        optimize "on"
    -- -------------------------------|All Platforms|------------------------------- --


    -- ----------------------------------|Windows|---------------------------------- --
    filter{}
    filter "system:Windows"
        staticruntime "on"
        buildoptions {
            "-GS", "-W4", "-WX", "-wd4251", "-wd4275", "-nologo", "-J",
            "-D_UNICODE", "-DUNICODE", "-DWIN32", "-D_WIN32",
            "-EHs-c-", "-D_HAS_EXCEPTIONS=0", "-GR-", "-wd4702", "-utf-8"
        }
        defines {
            "GTEST_OS_WINDOWS"
        }
    -- ----------------------------------|Windows|---------------------------------- --


    -- -----------------------------------|Linux|----------------------------------- --
    filter{}
    filter "system:Linux"
        buildoptions {
            "-fno-exceptions", "-Wall", "-Wshadow", "-Wno-error=dangling-else",
            "-Wextra", "-Wno-unused-parameter", "-Wno-missing-field-initializers"
        }
        pic "On"
        defines {
            "GTEST_OS_LINUX",
            "GTEST_HAS_RTTI"
        }
    -- -----------------------------------|Linux|----------------------------------- --