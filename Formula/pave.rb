class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.22"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.22/pave-darwin-arm64"
    sha256 "98dd817c0b54450816f8fad0f9c9055e66911964dd205f887fafe2e836739e06"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.22/pave-linux-arm64"
      sha256 "ce0a71cfbaa828f6c99c85afa01150cd7863dbfdb4753c2b6768d3cb9d95fe02"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.22/pave-linux-x64"
      sha256 "e1a1313b24c924a5277c756514d44c2617f6f199564c2a7ef17a1ec88369218b"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
