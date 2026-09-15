class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.106"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.106/pave-darwin-arm64.tar.gz"
    sha256 "62ead983673088ff3fae148480f250d8baca5ef9ace05de5963540340580f5e8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.106/pave-linux-arm64"
      sha256 "ebd77054ee36344a2fc7c98ebaefe896cb0f0e50a37b8e3855d12012cf2825d8"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.106/pave-linux-x64"
      sha256 "c76232840e64a01ba53a525941ccb8c4d7f1b17247855f8b2467ebc2c28dacde"
    end
  end

  def install
    if OS.mac?
      bin.install "pave-darwin-arm64" => "pave"
      libexec.install "portable-git"
    else
      bin.install Dir["pave-linux-*"].first => "pave"
    end
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
