package("translatorapi")
    add_urls("https://github.com/LordBombardir/LLTranslatorApi/releases/download/v$(version)/LLTranslatorApi-windows-x64.zip")
    add_versions("1.0.0", "54b7beaf3944af713169d8d62d25c64eb3974ecae901a8afb819231ce0eea77b")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
