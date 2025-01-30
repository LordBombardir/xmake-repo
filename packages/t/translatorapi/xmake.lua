package("translatorapi")
    add_urls("https://github.com/LordBombardir/LLTranslatorApi/releases/download/v$(version)/LLTranslatorApi-windows-x64.zip")
    add_versions("1.0.0", "e2a55744a50444d3c9a4065a917efede5fc6e250df04fb1ab6785c198118d33c")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
