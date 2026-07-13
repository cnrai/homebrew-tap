class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.42"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.42/pave-darwin-arm64"
    sha256 "293c4398661655098edcb05876a13a105d1dac42ec2a1996b4e4de56264bb5d0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.42/pave-linux-arm64"
      sha256 "17be85ac3b8682c683086755ccf5097646441131e6cf42edd8b6e08108eb654e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.42/pave-linux-x64"
      sha256 "5812aecdace96cb137d55b3533c9995691ce794ae9e63d4d231bdd1a2ab5d4fa"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
