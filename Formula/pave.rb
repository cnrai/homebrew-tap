class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.71"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.71/pave-darwin-arm64"
    sha256 "90c407939240a8f6f8e1d9ac473c02fef73eceec952b02e65c10180c31804ec5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.71/pave-linux-arm64"
      sha256 "392018ce977510b9e7635c623121ebf4020665714502e7c79db3f9f3592ccb12"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.71/pave-linux-x64"
      sha256 "fcb858b32e6fd1270c404e1398424de0094e0789d3ef59a60db2cd82ad97a0af"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
