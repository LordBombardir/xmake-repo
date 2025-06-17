package("playerdb")
    add_urls("https://github.com/LordBombardir/LLPlayerDB-Release/releases/download/v$(version)/LLPlayerDB-windows-x64.zip")
    add_versions("1.0.0", "45024f78624d3ab11b788e962412906683245f072e0d1801ca5375cb99244a4c")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
