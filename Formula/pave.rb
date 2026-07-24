class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.56"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.56/pave-darwin-arm64"
    sha256 "09f97e01811a2eea38aa84122a9fd78fc0e5d545fe8cedcc90fd4146241aab26"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.56/pave-linux-arm64"
      sha256 "76aa7cd907ac3c6dfb524b09fdd762cd804fb42340f7e272fab5f47f6255bda6"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.56/pave-linux-x64"
      sha256 "4991b045cf4d6281ee587f2c28f5505152666323df73d9fcb42f2f562528fa2a"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
