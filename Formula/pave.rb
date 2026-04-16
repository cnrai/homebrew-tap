class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.4"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.4/pave-darwin-arm64"
      sha256 "f31d56801d8d3aed58a39cfa3509ed932d94c155fc1d4e54d52e3a7e4abb6165"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.4/pave-darwin-x64"
      sha256 "c3ab2e418392d499e192d93bf72860ce62aff1b2befcc8191503a479bbbb1b7a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.4/pave-linux-x64"
    sha256 "3964bfcb930cd1c17fcfd9e0515ee1003dada394561a5e9af740413299e408ca"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
