class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.12"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.12/pave-darwin-arm64"
      sha256 "84567baebb35ffebf9e8b85fd86871b8554b619f355a46a8c8fe9a9a93a2ecb5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.12/pave-darwin-x64"
      sha256 "f327c67abc297fc8a7e8b0b961172eef0eee1aef2de98081547415bd925265a5"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.12/pave-linux-x64"
    sha256 "674af723af684690bdfc092948f7f90bc1f869c313bc4c041df3e644b6569a0c"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
