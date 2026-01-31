package("translatorapi")
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

    add_urls("https://github.com/LordBombardir/LLTranslatorApi/releases/download/v$(version)/LLTranslatorApi-v$(version)-{target_type}-{mode}-windows-x64.zip")

    local shas = {
        ["1.3.0-server-release"] = "619292f33cc85bb0bafb6c8666faf1416bff5ae922cea19556e854b4a454119d",
        ["1.3.0-server-debug"]   = "f4b85842fdbc29b2373f5217aac06cdda1846b2c524a6e6f1257ceb7bcddf6f7",
        ["1.3.0-client-release"] = "9401629e572a23070f746bf41ab954566944179ebad6189f549a566adc59d2bf",
        ["1.3.0-client-debug"]   = "847a0061d026ac4045578747ef7334fd83bf57cb7da4e27d9fe1701aaa7f1f45",
    
        ["1.3.1-server-release"] = "fa07913b1fa7cb05951b75136ebe8d5b17cba3fd500c921952833196444fb973",
        ["1.3.1-server-debug"]   = "07d3e21c19ff04fca70284d0f7ea78e15b67c5717d22a80ecfa7c9ce8803399a",
        ["1.3.1-client-release"] = "4b77eb901acd7537f190e2151115db1cff5e161da8612d199342e6ae5fc05bc9",
        ["1.3.1-client-debug"]   = "8f70cf93fedd819cf9658e1e50ec205dd30d56a2e939163cbf5fc0cb4531094a"
    }

    on_load(function (package)
        local base_ver = package:version_str()
        local tt = package:config("target_type") or "server"
        local mode = package:config("mode") or "release"
        local ver = base_ver .. "-" .. tt .. "-" .. mode

        package:set("version", ver)
        package:add("urls", ("https://github.com/LordBombardir/LLTranslatorApi/releases/download/v%s/LLTranslatorApi-v%s-%s-%s-windows-x64.zip"):format(base_ver, base_ver, tt, mode))
        package:add("hashes", shas[ver])
    end)

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
