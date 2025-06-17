package("playerdb")
    add_urls("https://github.com/LordBombardir/LLPlayerDB-Release/releases/download/v$(version)/LLPlayerDB-windows-x64.zip")
    add_versions("1.0.0", "6c78748a3df041047ad8c8d67169557bcd553bea8ee9e4733836880ed774b701")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
