class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.5"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.5/pave-darwin-arm64"
      sha256 "7c6f8972d59d76b2cffa54b916255053fa562381c43b6adaeaab3c7ea82fb594"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.5/pave-darwin-x64"
      sha256 "ef952067defd49b9e50a7a1bfa4180e0ca0622e5fa734d41427ae81f972b97a3"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.5/pave-linux-x64"
    sha256 "3b6d6651e70ecddb63bc7ffa24fcf9e5b580de2e32c67a4f3f9af597370d13f0"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
