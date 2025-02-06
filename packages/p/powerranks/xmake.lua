package("powerranks")
    add_urls("https://github.com/LordBombardir/LLPowerRanks/releases/download/v$(version)/LLPowerRanks-windows-x64.zip")
    add_versions("1.0.3", "bc08e429d24a883b339b57a8eedbfaf2379787bb24162516e6c7df72b1762f16")
    add_versions("1.0.4", "d9601e06dc539853cc128616c05f34246c954cc9410d7f5cd076693120ec45bf")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
