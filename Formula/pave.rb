class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.122"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.122/pave-darwin-arm64.tar.gz"
    sha256 "a814d88721c87e900ed9e1a936445219913c78347e442faa18f1b0a2c1293a84"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.122/pave-linux-arm64"
      sha256 "9c5baffd75468d1158e4479d2cf640c0347a527a2a787acdcab8e36455101a52"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.122/pave-linux-x64"
      sha256 "1797f3c7c5efd7bc19923be2c8df73d4841f12a4f32d0ec9f062f2d9c9328653"
    end
  end

  def install
    if OS.mac?
      bin.install "pave-darwin-arm64" => "pave"
      libexec.install "portable-git"
    else
      bin.install Dir["pave-linux-*"].first => "pave"
    end
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
