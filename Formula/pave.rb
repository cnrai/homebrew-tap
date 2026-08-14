class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.77"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.77/pave-darwin-arm64"
    sha256 "b6e46e1815bba7700ccd56f89b30f036bd871cc562c28ff3c0a141e005e88cb2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.77/pave-linux-arm64"
      sha256 "4216d22d5b8b725c32ffc9f2323f5d7130009e938a24ff264284415112b29ee9"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.77/pave-linux-x64"
      sha256 "a4265e09a68fab0f141cb6b65c36a18ffdcf492ada86bd534c1b040dfb026b27"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
