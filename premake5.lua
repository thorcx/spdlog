project "spdlog"
	location(prjfile_dir)
	kind "StaticLib"
	language "C"
	staticruntime "off"
	targetdir ("./lib/".."%{cfg.buildcfg}")  --spdlog静态库直接输出到自己的库的lib内
	objdir (obj_dir)

    files
	{
        "./include/**.h",
		"./src/**.cpp"
    }

	includedirs
	{
		"./include"
	}

	filter "system:windows"
		systemversion ("10.0.18362.0")

		defines
		{
			"FMT_EXPORT",
			"FMT_SHARED",
			"SPDLOG_COMPILED_LIB"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
