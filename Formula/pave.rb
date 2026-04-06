class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.7.0"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.0/pave-darwin-arm64"
      sha256 "21f5b8d96f534f1037549dbabf1f706ccdc56b763cfb4521921e452423510466"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.0/pave-darwin-x64"
      sha256 "1ba9f299282f4d8e9bd233bc8d9fbca0fba20473a9ac88a6146961f00c804856"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.7.0/pave-linux-x64"
    sha256 "b38a5c0da9874e527da2fcc9d2dffb1cfbb42bb4833b2fc2160f40732c82f0d0"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
