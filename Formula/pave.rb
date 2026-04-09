class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.7.5"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.5/pave-darwin-arm64"
      sha256 "de4b7226116d06518ce6f4adf9e3d93d050ff0fa1d6f0bb408f0daa6a435f858"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.5/pave-darwin-x64"
      sha256 "8942a6dc35b583ccb6d70e228fd9f4e893f71a07644b772708f44e6d6888b019"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.7.5/pave-linux-x64"
    sha256 "443419265b904ffaa018cecd08160f11f76ce103e911c8dfe941ff37f47f2413"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
