class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.35"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.35/pave-darwin-arm64"
    sha256 "173e2082730f7eb56e0495b4dcf2161d39e2d3471e10ec7f3106b4d52088e1fb"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.35/pave-linux-arm64"
      sha256 "d5ac9ec102c4b64e54e3ba529e3e0bc484e1046daab8ef220773244cccf4ab73"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.35/pave-linux-x64"
      sha256 "d9feb5f51e85b1278724f271815e679b1a576e17268dfb7ee405db7ca9827c10"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
