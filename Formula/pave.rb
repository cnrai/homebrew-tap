class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.83"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.83/pave-darwin-arm64"
    sha256 "dfed1b271911f0164a336f899200185caf47fccf1909756e54e9677362bd9814"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.83/pave-linux-arm64"
      sha256 "0256fc60388a288128bbe7a105355ad02276acc03c720f01c641ace532fe8774"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.83/pave-linux-x64"
      sha256 "25483fb113654791974c68ef1a94c303201ac83bd14a882c6a7de52e3a492b25"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
