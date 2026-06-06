class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.10"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.10/pave-darwin-arm64"
    sha256 "db2477a12f20f4353d5dc5ee41a58bb4ab45ed1ec73adfca5e9ce0ba0f7b56da"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.10/pave-linux-arm64"
      sha256 "fb2fe787c46af0299e203948f2844184b4376c212dedb5cf5f6ca824034f0ee3"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.10/pave-linux-x64"
      sha256 "8502992cdc2c224f223c95b5f642fd758af4b9ee226fd141d2b801f75e42678b"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
