class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.60"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.60/pave-darwin-arm64"
    sha256 "f02ef4a9b07a4fcb764abe6ade33576a10ee2acebce3bba014741047dc4b33b1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.60/pave-linux-arm64"
      sha256 "ec400e3c4dd1a59acbd76675310ba1fb36fbea270e3fad167eb9eff52091257e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.60/pave-linux-x64"
      sha256 "62c7e8a11481934de92484e60cc0bc9fcf82c0050705dc2dde1c96e4648a01d8"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
