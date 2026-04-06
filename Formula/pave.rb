class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.6.0"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.6.0/pave-darwin-arm64"
      sha256 "0bc24a4cd5e9d58311a22da179d5d6845ec039324564da27f9ec93b20e1b6f1c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.6.0/pave-darwin-x64"
      sha256 "34faddb6c51ce9873ffea133248f26d4b454f95daf3f105f05f990cf64e47457"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.6.0/pave-linux-x64"
    sha256 "6f1b07b6f20c1d3f5fe07f845ab608b1a20b807c179cdb7732da91a2c705a533"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
