class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.14"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.14/pave-darwin-arm64"
    sha256 "a1437615ef8e9d2b2cb7bbf1e7911bed5a001502787e0c4ede5423a176e5c76f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.14/pave-linux-arm64"
      sha256 "16c873b9413bf080f406ca645579e327a02fd8e7cde83f384f3b85c93a0287e0"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.14/pave-linux-x64"
      sha256 "443429ae67d16729f70735801da37c0370d3614d0cf55d7bee9ab344386c8340"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
