class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.8"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.8/pave-darwin-arm64"
    sha256 "af90cdc93040c1805325f6f3456160af40d2b096f62506e782eb284397c9740f"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.8/pave-linux-x64"
    sha256 "662e74e93944f21473c1bb5862c477fb04868827631827e01a723ff7a92ba750"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
