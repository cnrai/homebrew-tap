class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.15"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.15/pave-darwin-arm64"
      sha256 "5f4380bbedc3c0add0f229115d3838a7e66b836155e0c5f685be653502812646"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.15/pave-darwin-x64"
      sha256 "c484c31ea0f53c5cc930dad38c2b0afa88615a7afeea4848397c9c917f9c05ad"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.15/pave-linux-x64"
    sha256 "fd3fddfea4cb1e450d64e1a9f8cad323ea2af4ec8a53a3b8a1df4c135e9476c6"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
