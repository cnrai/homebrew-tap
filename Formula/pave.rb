class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.12"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.12/pave-darwin-arm64"
    sha256 "789757dd23a6d7ec2daf18eb50f924ef4c828ca481545b8c0544a8d497904c1b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.12/pave-linux-arm64"
      sha256 "e35cab2e9f1756f6cba0483e8750278d79f8c326389553bbbc368984049c856a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.12/pave-linux-x64"
      sha256 "d96193002e128cde92e73b404840c9a16b4bebcec88aed624407362a63cc9150"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
