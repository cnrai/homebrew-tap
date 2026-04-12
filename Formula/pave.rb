class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.8.4"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.4/pave-darwin-arm64"
      sha256 "e2bbc6f5c2665252e4a87274b932d4dbe409d46ad95793cfdfe2222f986f6964"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.4/pave-darwin-x64"
      sha256 "4dd68d091ce2772f2110e8797996aeb52385825cae8841915d9e620ef83fc5f8"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.8.4/pave-linux-x64"
    sha256 "71f6df83dd4548a40917115a70ebadc07dfbfa0f87731e440e304648b4c31790"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
