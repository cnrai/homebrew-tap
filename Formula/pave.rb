class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.25"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.25/pave-darwin-arm64"
    sha256 "5a308f2c15344c85fc31d8e9bc2c6225ff4ec39c1164abfbc1261f6b707291a6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.25/pave-linux-arm64"
      sha256 "87aedb319fb521b54a71c68cb9fc2129dea535f297fd817bc90e7c1fea6656b0"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.25/pave-linux-x64"
      sha256 "fcb3e402aace303df0af6653d3c85b89448ecd59f21b9d23dc3dd7431563764a"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
