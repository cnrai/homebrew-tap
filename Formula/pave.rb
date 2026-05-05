class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.1"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.1/pave-darwin-arm64"
    sha256 "cccb674389b55a1aab5f8912234628cb26489d42ed6df93fe085fc48db9aab34"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.1/pave-linux-x64"
    sha256 "2cd448cec2436715bd2f206f20fcca4289da78e5facfb25a57b4a59242a3416b"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
