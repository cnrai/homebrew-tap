class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.15"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.15/pave-darwin-arm64"
      sha256 "9fc8702c11e0b4cdc70f0294573e34ed820f3accd58f08ee203252c89bc0db69"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.15/pave-darwin-x64"
      sha256 "84e5048e7d848b94abb3260c6f3712f089ce37195be50329029c9eb4e6ecc722"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.15/pave-linux-x64"
    sha256 "c5762b9b83f404f0877b68f58ed38dc56d7dbfde68ab3602c828f0645da539d7"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
