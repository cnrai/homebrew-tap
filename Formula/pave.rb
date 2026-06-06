class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.9"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.9/pave-darwin-arm64"
    sha256 "501b4532f20576c4cfb7c0b84b97442f585164b178881c124e0f6f4319560bab"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.9/pave-linux-arm64"
      sha256 "adef47decb0a5f4a4a85021f7782d3038eac5aed112ca51d6e21b36d6fe06c14"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.9/pave-linux-x64"
      sha256 "14afe4d5d7b5f8f56e1305efc012fd024a7a56b84be31ee32bdf1c0d180db669"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
