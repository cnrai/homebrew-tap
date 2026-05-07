class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.3"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.3/pave-darwin-arm64"
    sha256 "98b813ac7fc7552c39920d6be7cd3cb429bc2a2a58d85ac0ae765cabb481a273"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.3/pave-linux-x64"
    sha256 "2c4a753cf423c10d780da1a9cbc984f27d8fe9efd8cebc779a0d4419b61d2f09"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
