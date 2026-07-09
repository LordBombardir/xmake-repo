package("playerdb")
    add_configs("target_type", {
        description = "Mod target type",
        default = "server",
        values = {"server", "client"}
    })

    add_configs("mode", {
        description = "Build mode",
        default = "release",
        values = {"release", "debug"}
    })
    
    add_urls("https://github.com/LordBombardir/LLPlayerDB-Release.git")

    local shas = {    
        ["26.20.0-server-release"] = "0f2f9e3cc3c5616af6e5b7fc1879c711eadc849e9465028143ef9d3626686930",
        ["26.20.0-client-release"] = "bedfa438e96908d0b116aa781ea03efb0689b21a45f3adf49732621ee57246f4",
    }

    on_load(function (package)
        local base_ver = package:version_str()
        local tt = package:config("target_type") or "server"
        local mode = package:config("mode") or "release"
        local ver = base_ver .. "-" .. tt .. "-" .. mode

        package:set("version", ver)
        package:add("urls", ("https://github.com/LordBombardir/LLPlayerDB-Release/releases/download/v%s/LLPlayerDB-v%s-%s-%s-windows-x64.zip"):format(base_ver, base_ver, tt, mode))
        package:add("hashes", shas[ver])
    end)

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
