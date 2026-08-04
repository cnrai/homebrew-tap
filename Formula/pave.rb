class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.62"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.62/pave-darwin-arm64"
    sha256 "274e944d226252bbf6bc3f351ebb5b677e95944bea0d106df82ea0e5c2b91a55"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.62/pave-linux-arm64"
      sha256 "8f0bc430a897e11a831e04d9a527b1c1a3a9252505324397d15028aaad11b543"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.62/pave-linux-x64"
      sha256 "c312abeb7082837b1f678e1446368441820662fc7d548238901a39a4049ae7be"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
