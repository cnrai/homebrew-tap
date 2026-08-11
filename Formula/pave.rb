class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.74"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.74/pave-darwin-arm64"
    sha256 "1b067f7d8c3dfde0bbfcb616413f97b0f3a6d175472dee936725a20c97651bb3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.74/pave-linux-arm64"
      sha256 "53a486d7dc62f1d63d4cb9279f8360bcb448dff116becfb9bc77dc2b57eb050d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.74/pave-linux-x64"
      sha256 "6d6526bfc56696dbadb73b2596ab6357bf494dbf9604e3ef93244ffa0ee261c9"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
