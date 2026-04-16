class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.7"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.7/pave-darwin-arm64"
      sha256 "80358226d6b9fab1dd8752d2106d79c1ffb02859c504982cfa31cf3e05936fb5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.7/pave-darwin-x64"
      sha256 "3cc789c2429beeb7657e979e7e9408b7f179656e1138415bb968a96d43d6f25c"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.7/pave-linux-x64"
    sha256 "ecd71fe2f3568782284a7f56c0b8c84c3fda9078a4d7c054afcc03f664a437a7"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
