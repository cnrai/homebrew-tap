class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.31"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.31/pave-darwin-arm64"
      sha256 "8f962f1d7a6509315f27382eee0ddca46fc7cf5bc56c4d47f3473e176d048ba5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.31/pave-darwin-x64"
      sha256 "5f44f92ec9a4ab83e6f6fab09752c0136a3025b28430e8097d01e7156fd5ca59"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.31/pave-linux-x64"
    sha256 "238334f50dc1aaf4021a34299c9e13ecb488b5a465a0114b49145e004f520398"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
