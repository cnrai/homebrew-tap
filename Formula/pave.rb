class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.1"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.1/pave-darwin-arm64"
    sha256 "65b054cba7078b41f29520cbbe2d359e1ef5a8bab3c0de6a59e1a0be9af17e4b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.1/pave-linux-arm64"
      sha256 "92b0bec98d3c7e0503fc47eaea80ae5621df08c815ce5e0182798b989764a2fc"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.1/pave-linux-x64"
      sha256 "83ac81c0145cea90646da44bff688caebc0f0bbca4cce89bef00a11e38b852f3"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
