class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.7"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.7/pave-darwin-arm64"
    sha256 "90e368b13e72ead8f721b66e258577c3e8be514fa7952448e325ff3487ec2cd8"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.7/pave-linux-x64"
    sha256 "6dcc5d88c71cff0644f32e46f7c3d8844ecd0b3a50786013f1808d1b55ab7f3f"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
