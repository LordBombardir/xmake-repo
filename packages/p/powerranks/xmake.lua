package("powerranks")
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
    
    add_urls("https://github.com/LordBombardir/LLPowerRanks.git")

    local shas = {
        ["26.20.1-client-release"] = "d1086297e9d5f2e6a75675bf7765ebfde3d9fba8beda1dcb249367c8e83ab992",
        ["26.20.1-client-debug"] = "ffcfeaaa1988140ed5f70ae3647e5245f16958c75020bd650a9d975cd701ec86",
        ["26.20.1-server-release"] = "b9c84a8d023664951b36943a76cc2591e157c4f92791181f325b2276d5449c89",
        ["26.20.1-server-debug"] = "1c6100ecfe87bf5e689c2d38a9e3987c4741070c448d144f2f544273ea8ffaca",
    }

    on_load(function (package)
        local base_ver = package:version_str()
        local tt = package:config("target_type") or "server"
        local mode = package:config("mode") or "release"
        local ver = base_ver .. "-" .. tt .. "-" .. mode

        package:set("version", ver)
        package:add("urls", ("https://github.com/LordBombardir/LLPowerRanks/releases/download/v%s/LLPowerRanks-v%s-%s-%s-windows-x64.zip"):format(base_ver, base_ver, tt, mode))
        package:add("hashes", shas[ver])
    end)

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
