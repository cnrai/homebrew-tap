class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.61"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.61/pave-darwin-arm64"
    sha256 "5609bef9b22fcb7908a4f5f9f2d0e1778edb00cd0b09e5abb2966b44ccacd6b8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.61/pave-linux-arm64"
      sha256 "1a1632be5211d263f9531114891697b4fd3cc6adc04e05380cca29f5c8bf482f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.61/pave-linux-x64"
      sha256 "f962288345369d6cc2c73f6376c99a238dce6f5cae5bddacb80c372852ea7eda"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
