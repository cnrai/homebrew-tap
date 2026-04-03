class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.25"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.25/pave-darwin-arm64"
      sha256 "c32e5f3c2831081ac3e4afffa8c90b2a0f2f45da6e35158e6e333faa412d90f8"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.25/pave-darwin-x64"
      sha256 "d6e9469bf27cd2c884d559684a8ffee355aecafcba859dbdee4eb53bb7427cda"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.25/pave-linux-x64"
    sha256 "ac0c2eb2e85e69aed5f67dd705119645931f5ce99067d60cb9d1eeb84694b0a0"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
