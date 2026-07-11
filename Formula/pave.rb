class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.37"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.37/pave-darwin-arm64"
    sha256 "7fdb736011a04380fffa396d50a7dd14bc82518df9a556b33188c7443900b36e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.37/pave-linux-arm64"
      sha256 "2fda0fb8e8810fc6d863b355465a570b6f30ed7b66985f0b3abf7ee2f54ff711"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.37/pave-linux-x64"
      sha256 "c94fd2f240b41da07c789752757f99f453cf731270c332c4da230296eace2a80"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
