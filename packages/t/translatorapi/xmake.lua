package("translatorapi")
    add_urls("https://github.com/LordBombardir/LLTranslatorApi/releases/download/v$(version)/LLTranslatorApi-windows-x64.zip")
    add_versions("1.0.0", "636cf21022fd5923fe83672eb26496350fa42ace3ea7a984b8fa59546655751d")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
