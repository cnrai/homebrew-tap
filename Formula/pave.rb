class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.28"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.28/pave-darwin-arm64"
    sha256 "d729ffe21026c5a1374be017d60c99e1ceff8329dc6f30eec837500ba3f661f0"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.28/pave-linux-x64"
    sha256 "7fcff17489490da99057432f208bf1fa1c9fab66dcaef1ddaab55aca803e159e"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
