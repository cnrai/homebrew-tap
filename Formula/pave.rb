class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.46"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.46/pave-darwin-arm64"
    sha256 "f2808da875afac6456c5cc93cca82affeaa1ecb8d0fda746242b4bcb6ef3b8e1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.46/pave-linux-arm64"
      sha256 "f83833f52313283d9bc7313f426a9c59ed28532c70484697b2cb0a58648dffcc"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.46/pave-linux-x64"
      sha256 "1091f9fdbaed04b5ccdd064957327a70579c328f7cdb30fe8d1a8b4d6f565376"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
