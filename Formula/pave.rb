class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.23"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.23/pave-darwin-arm64"
    sha256 "82d591613a8a58c9de80bde864798096b47b3310e6e32d35db8cd9d8642ddd00"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.23/pave-linux-arm64"
      sha256 "7b2d3160e92ad3cbc188cd73f48bae385e1aef9c925293676da7d51aaf215c14"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.23/pave-linux-x64"
      sha256 "3cdf2fbec4f49cb2241d481bf6e223bc49bf729d0a7d4006939fe8e09c77a3cb"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
