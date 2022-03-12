project "googlemock"
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
		"../googletest/include/"

	}

	filter{}
	filter "system:Linux"
		pic "On"

	filter{}
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter{}
	filter "configurations:PreRelease"
		runtime "Release"
		symbols "on"

	filter{}
	filter "configurations:Release"
		runtime "Release"
		optimize "on"