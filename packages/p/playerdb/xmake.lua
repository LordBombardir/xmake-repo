package("playerdb")
    add_urls("https://github.com/LordBombardir/LLPlayerDB-Release/releases/download/v$(version)/LLPlayerDB-windows-x64.zip")
    add_versions("1.0.0", "affb7d22763ba1c85332c3e7d295ae4c93b60a4029d758c8704d614d3c7b3e3b")
    add_versions("1.0.1", "971434662a21bebdd8165077a9731333d43eaee044b5628462194168a1590ed8")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
