class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.21"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.21/pave-darwin-arm64"
    sha256 "6cd0a05a9ef24296b06ceec1adab8f87ed36349553cf8a3331e55f58fa03ab70"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.21/pave-linux-arm64"
      sha256 "39ad76fb8c7b1ed2fd1ce5362f7972c307c4ab1209f9ee94de5513c8eb9075dd"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.21/pave-linux-x64"
      sha256 "61f032d307dc782556e9ab46baac43e9c02bb2158a44ee1e7b988501c0e69d11"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
