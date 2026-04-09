class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.8.0"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.0/pave-darwin-arm64"
      sha256 "db0fbfc7ca4793f8f8fad7139665c5c0da98cb8c92d7109f3adbd2af5c8b1e7d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.0/pave-darwin-x64"
      sha256 "0a4cbbfa063391d88c60b5c483f25f587e112e0c7c1cf1fc97effc6ef27b8850"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.8.0/pave-linux-x64"
    sha256 "f6a0225f4b79b08cf938d95997f1a0178fc5dcf93aad74c8033f5d7e9502a7cb"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
