class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.41"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.41/pave-darwin-arm64"
    sha256 "5b193418540a25f58cf4525a9edeb304e8122d7dc9ca77fe1de01e3d2e1869a9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.41/pave-linux-arm64"
      sha256 "e23e7d358fc9f30829823d1c02b8f7e03f08181a48c10855065e4cc99839dca7"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.41/pave-linux-x64"
      sha256 "184b647dc8cf1e05b868a5197e4d8f81ef159a93fa1afc4aacd065e1e885dbbf"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
