class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.20"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.20/pave-darwin-arm64"
    sha256 "281b169cd0625675d05ac049ed1a94bdb6935d01ff6489e0be8be0e35dd0dcd1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.20/pave-linux-arm64"
      sha256 "cd30cf6c3a5f7d69f204cf8488ea912058385ae72fc44c69a438eb63045458bd"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.20/pave-linux-x64"
      sha256 "da72b023cd372ac02517cf11fe39d2c23eea145a80c7c61ca33ee966fc322b21"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
