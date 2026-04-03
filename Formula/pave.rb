class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.28"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.28/pave-darwin-arm64"
      sha256 "d2b55024fafeb0eea99e6275855f5556feba422f101a51e875f0591e9f05ad82"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.28/pave-darwin-x64"
      sha256 "10c9664afa1b5bb27395314e8f636d81c0326cde7e7d0d89c6343ca68efcc7f6"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.28/pave-linux-x64"
    sha256 "b9675096a82a3df789b86d34b807d1dbf3ccc9cf0b2f0f2fe7f030b5d139a1a2"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
