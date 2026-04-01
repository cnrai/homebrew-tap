class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.21"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.21/pave-darwin-arm64"
      sha256 "3129aa94a4898e21fc3985be456758ca3aa67fcd6625b7d36752d225114cd442"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.21/pave-darwin-x64"
      sha256 "d8e045f805c67233034dac195d8dbf801a5f3f9acec5a09c58a9798d45efb11a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.21/pave-linux-x64"
    sha256 "c4ec3fb9d8e94a524d35bf98685adadad7d2b9e522d56aa7fcc0b3a0378fe7bc"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
