class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.65"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.65/pave-darwin-arm64"
    sha256 "05baea975ba10a181d1cf071def3d4004ba999ed54e7e4ed31b11d5c377482aa"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.65/pave-linux-arm64"
      sha256 "a21a81af056aa7ddc32cc06b4c0252ce922ee91228c2c76bdef04d6aafc82be3"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.65/pave-linux-x64"
      sha256 "8d47e858b4a5c4bfe133f64961736e71782be2ca444ce94df2aadbface80a6b8"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
