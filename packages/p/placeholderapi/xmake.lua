package("placeholderapi")
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

    add_urls("https://github.com/LordBombardir/LLPlaceholderApi/releases/download/v$(version)/LLPlaceholderApi-v$(version)-{target_type}-{mode}-windows-x64.zip")

    local shas = {
        ["1.0.0-server-release"] = "353321f6b891690feb083e38df3e039775914b0a1c834408b2c8d2038d5e23da",
        ["1.0.0-server-debug"]   = "2d04d4935220ec14bcc9c5922a9ba4e52000838e83606e366ddf14c582c187bd",
        ["1.0.0-client-release"] = "f9218e9beff323e84bac1b15a4508b574d43995798c62582274f050498693ed5",
        ["1.0.0-client-debug"]   = "e97456e8755920e942893110bf3953b66227fb171404c7ead1841206fa3fde40",

        ["1.0.1-server-release"] = "50291eef1c60937fefd66c59b49f8110c9e750262524a8bd57e5164013e92da6",
        ["1.0.1-server-debug"]   = "a9d9d0cf9dd56f802004bbbd2164ffeefb12bea8e247574cab826cf2dabb05ef",
        ["1.0.1-client-release"] = "0649df916831d3faf15cb6fd6217ed93f0e2d7cd9b67a1aba67542771182ec40",
        ["1.0.1-client-debug"]   = "a3c393b6d7c2751dc8ba9659c75aaf658fa30f7ba822a02f7abaa683086df53f",
    }

    on_load(function (package)
        local base_ver = package:version_str()
        local tt = package:config("target_type") or "server"
        local mode = package:config("mode") or "release"
        local ver = base_ver .. "-" .. tt .. "-" .. mode

        package:set("version", ver)
        package:add("urls", ("https://github.com/LordBombardir/LLPlaceholderApi/releases/download/v%s/LLPlaceholderApi-v%s-%s-%s-windows-x64.zip"):format(base_ver, base_ver, tt, mode))
        package:add("hashes", shas[ver])
    end)

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
