project "googletest"
	staticruntime "on"
	kind "StaticLib"
	language "C++"
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
	filter "configurations:Debug"
		defines "DEBUG"
		runtime "Debug"
		symbols "on"

	filter{}
	filter "configurations:PreRelease"
		defines "NDEBUG"
		runtime "Release"
		optimize "on"

	filter{}
	filter "configurations:Release"
		defines "NDEBUG"
		runtime "Release"
		optimize "on"
	-- -------------------------------|All Platforms|------------------------------- --


	-- ----------------------------------|Windows|---------------------------------- --
	filter{}
	filter "system:Windows"
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
		pic "On"
		buildoptions {
			"-Wall", "-Wshadow", "-Wno-error=dangling-else", 
			"-fno-exceptions", "-fno-rtti", "-DGTEST_HAS_RTTI=0"
		}
		defines {
			"GTEST_OS_LINUX"
		}
	-- -----------------------------------|Linux|----------------------------------- --