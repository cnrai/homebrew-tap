class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.20"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.20/pave-darwin-arm64"
      sha256 "1e73563deb460310c91029d84224b4ed814b6592480fd533fddf7dba012c54f6"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.20/pave-darwin-x64"
      sha256 "032d5bd3c461479a6598609968868f5edc09638e4f3237fbaaf18a8235212d3d"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.20/pave-linux-x64"
    sha256 "4f57c009f053a10517de03f6534028cd6c1abfe409b98b3066defd0f92677d37"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
