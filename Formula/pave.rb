class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.51"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.51/pave-darwin-arm64"
    sha256 "61e8c5831c3e73873434d3f2a4db91921bbc31ed862b0c451321a76ba12dfbfe"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.51/pave-linux-arm64"
      sha256 "7cb75dacc7a49c3485ec257a97b9ba984d3310f1718179469783970ebc404c61"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.51/pave-linux-x64"
      sha256 "5af1be8818697fd91d57828fce76a34e0b446c2b2600f285c0b13c8c7051d864"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
