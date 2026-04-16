class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.2"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.2/pave-darwin-arm64"
      sha256 "e95f85a17fc192bffa5cc3df225919d7fc8fb6cd507dc93d3179d6e0aa1997ae"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.2/pave-darwin-x64"
      sha256 "7355c12e136595acd685568279c31109da8523952b54eaafbbf17e268d6e6062"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.2/pave-linux-x64"
    sha256 "2adefdd6ff53b42e44e6499f25e7ac21881cc58405b04c293482fb8962a67a07"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
