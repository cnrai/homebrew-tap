class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.8.1"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.1/pave-darwin-arm64"
      sha256 "e6ae1fb95cfda473ddcb4d61fd571e0a77943020032cc88f55d1abe7eea92a01"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.1/pave-darwin-x64"
      sha256 "9fc1700ad81bc325b7b2e761aa518bd2b9ef621fdb032577ba46b3045554a6a4"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.8.1/pave-linux-x64"
    sha256 "26bc26ac01530583e04ab8877a2fcf3ea06850b7ea227ea69b7bcef5b0e0cc22"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
