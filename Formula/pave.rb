class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.23"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.23/pave-darwin-arm64"
    sha256 "6b59e779ce9e152166b2528a2e945203a6bf7a5b4436f43042eb5824a164c5cb"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.23/pave-linux-x64"
    sha256 "b1d2cb0108e956cf637d5d90e9768c643d2bb674adcdff3a7be7411400badb1f"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
