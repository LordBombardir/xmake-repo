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

    add_versions("1.0.0")
    add_versions("1.0.1")
    add_versions("1.0.2")
    add_versions("26.10.1")

    local shas = {
        ["1.0.0-server-release"] = "353321f6b891690feb083e38df3e039775914b0a1c834408b2c8d2038d5e23da",
        ["1.0.0-server-debug"]   = "2d04d4935220ec14bcc9c5922a9ba4e52000838e83606e366ddf14c582c187bd",
        ["1.0.0-client-release"] = "f9218e9beff323e84bac1b15a4508b574d43995798c62582274f050498693ed5",
        ["1.0.0-client-debug"]   = "e97456e8755920e942893110bf3953b66227fb171404c7ead1841206fa3fde40",

        ["1.0.1-server-release"] = "50291eef1c60937fefd66c59b49f8110c9e750262524a8bd57e5164013e92da6",
        ["1.0.1-server-debug"]   = "a9d9d0cf9dd56f802004bbbd2164ffeefb12bea8e247574cab826cf2dabb05ef",
        ["1.0.1-client-release"] = "0649df916831d3faf15cb6fd6217ed93f0e2d7cd9b67a1aba67542771182ec40",
        ["1.0.1-client-debug"]   = "a3c393b6d7c2751dc8ba9659c75aaf658fa30f7ba822a02f7abaa683086df53f",
    
        ["1.0.2-server-release"] = "166bc441531f50eea33d08746afc063da61416d4e442b874557a57cfca0fadf8",
        ["1.0.2-server-debug"]   = "3c904f588a098f2b70cebf02f2eaf62116d99176d8db8417bf6083f4621c42db",
        ["1.0.2-client-release"] = "c3b8f9a84f36bcf968f6a93e1b66d49c7d9d1440d22eb95042760882db96cc96",
        ["1.0.2-client-debug"]   = "512723ebfa6e6882b27a3253ab8f5690d93aafe91e44846d8f956073c5b3a599",
    
        ["26.10.1-server-release"] = "4aef0107ff67b7046c93260f6f6885018d18feb063be4f2086b55938853e6e2e",
        ["26.10.1-server-debug"]   = "ffa93705af1d38d7e5dfa2fa84ad7dbedb5383527a8bc3c8c878764a937fb4a0",
        ["26.10.1-client-release"] = "f7906f215dd7c6b1ff7ff60b82a578d4c18f2283e929ce26b06a92ee0c7adc8f",
        ["26.10.1-client-debug"]   = "6ad8f34d4d832ca03704fd6a022b566abbae0bad85207b71c6a0012b9d3a9e20",
    }

    on_source(function (package)
        local base_ver = package:version_str()
        local tt = package:config("target_type") or "server"
        local mode = package:config("mode") or "release"
        local ver_key = base_ver .. "-" .. tt .. "-" .. mode

        local url = ("https://github.com/LordBombardir/LLPlaceholderApi/releases/download/v%s/LLPlaceholderApi-v%s-%s-%s-windows-x64.zip"):format(base_ver, base_ver, tt, mode)
        local hash = shas[ver_key]

        package:add("urls", url)
        if hash then
            package:add("hashes", hash)
        end
    end)

    on_load(function (package)
        local tt = package:config("target_type") or "server"
        local mode = package:config("mode") or "release"
        package:set("version", package:version_str() .. "-" .. tt .. "-" .. mode)
    end)

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
