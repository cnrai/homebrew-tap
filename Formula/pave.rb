class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.73"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.73/pave-darwin-arm64"
    sha256 "a3cb35cd8a0dccc7e651b11732c6200d8a5107d8787da0d3b2d64edf7119eb6a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.73/pave-linux-arm64"
      sha256 "752e761475570b5c7f2515ed455d73c06622e8fe1fa8be5515056ab851798c4a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.73/pave-linux-x64"
      sha256 "e134f84d3501655d54dd9b3c1da30923c26cac985555e8f5a5091e278e577a06"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
