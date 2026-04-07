class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.7.1"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.1/pave-darwin-arm64"
      sha256 "ce6daf709785da8c4fd2b8b96723f895b883fbc2cda4aa6b7de7f80d95a5c6ca"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.1/pave-darwin-x64"
      sha256 "e645b527b0c6542096687883dbf06559c508261dbb23772e0b36e1f1cddf069a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.7.1/pave-linux-x64"
    sha256 "45ae6c899b5d13a71c661e7ccd576ef86a3f1fb4741b5017259b7c1886fc8c43"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
