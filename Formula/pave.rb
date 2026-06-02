class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.8"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.8/pave-darwin-arm64"
    sha256 "abdcf2f0b1bf89fdadbfd968803ba8dadd802d07dcb79cae2cac88ac66281054"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.8/pave-linux-arm64"
      sha256 "9a8381b44603f66383eeb623856f8774507e3c46423c63dc4cf59d83a393c348"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.8/pave-linux-x64"
      sha256 "850fa591175fb708d7717b24e1c604d9a9455c6fa8e36670a33a596f29245293"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
