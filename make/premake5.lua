-- Mineblox build script

rootdir = path.join(path.getdirectory(_SCRIPT), "..")

filter { "platforms:Win64" }
	system "Windows"
	architecture "x64"


-- Solution
solution "mineblox"
	language "C"
	configurations { "Debug", "Release" }
	platforms { "Win64" }
	location "../_build"
    debugdir ".."
    characterset "MBCS"

	defines {
		"_CRT_SECURE_NO_WARNINGS",
	}

    --linkoptions "/opt:ref"
    editandcontinue "off"

    rtti "off"
    exceptionhandling "off"

	configuration "Debug"
		defines { "_DEBUG" }
		flags { "FatalWarnings" }
		symbols "on"

	configuration "Release"
		defines { "NDEBUG" }
		optimize "full"

	-- Projects
	project "mineblox"
		targetdir "../_bin/%{cfg.platform}/%{cfg.buildcfg}/%{prj.name}"
		objdir "../_obj/%{cfg.platform}/%{cfg.buildcfg}/%{prj.name}"
        kind "WindowedApp"
		files {
            "../src/**.h",
			"../src/**.c",
            "../.editorconfig",
            "../modules/kore/include/**.h"
		}
        includedirs {
            "../src",
            "../modules/kore/include"
        }

        links {
            "opengl32.lib"
        }

		configuration "Win*"
			defines {
				"WIN32",
			}
			flags {
				"StaticRuntime",
				"NoMinimalRebuild",
				"NoIncrementalLink",
			}
