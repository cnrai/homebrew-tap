class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.19"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.19/pave-darwin-arm64"
      sha256 "9c26de7103517798545ac42364c87d6c698e52d5497634f62d727beb9f0ce6a9"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.19/pave-darwin-x64"
      sha256 "d80579fa4745d17b03d2bda8b0bfacfb1f9659fb5ae4c3f760e8160fb6c65d13"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.19/pave-linux-x64"
    sha256 "719cace8e7abb982b5c5460896dc422e993fa71d05c55370001671af0864680e"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
