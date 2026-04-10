class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.7.6"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.6/pave-darwin-arm64"
      sha256 "ba28ba83a52f3d318aa79451b03f5071d3487b15e1ebe90d50f232a23441ab13"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.6/pave-darwin-x64"
      sha256 "7d3839bd35d2f85160e7ddffafdd0ee92ac1f465849ac79041fff3252fe35f83"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.7.6/pave-linux-x64"
    sha256 "ddef38320b9dc97b4a425d995ce32f056f11f0330ef5a85f5c665dae4630fb2d"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
