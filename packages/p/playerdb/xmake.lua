package("powerranks")
    add_urls("https://github.com/LordBombardir/LLPlayerDB-Release/releases/download/v$(version)/LLPlayerDB-windows-x64.zip")
    add_versions("1.0.0", "4fe648a98821ea9ee6d66ebc7dacbc8b985783ac0165c0eb47b0e93558dcbf97")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
