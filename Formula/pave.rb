class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.123"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.123/pave-darwin-arm64.tar.gz"
    sha256 "d4114903cb7a47d96b2da4c1213cf031c88d5be163c7e7a8dd7547734f747db5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.123/pave-linux-arm64"
      sha256 "6844ae3c8ffe35a2851881603c99ee3c1566be00d7d10b299b23ddc3067cd5c8"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.123/pave-linux-x64"
      sha256 "6690c90c857df3b051b5cf135eb52eb25a79f706a0eb52104a570bb81907d716"
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
