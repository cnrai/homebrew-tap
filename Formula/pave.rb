class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.2/pave-darwin-arm64"
      sha256 "2281a80907d70ff2d73860f2df8e2c5300f9dc9543eb28d6a91486ea62f1b515"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.2/pave-darwin-x64"
      sha256 "7998d1037191a161a44bc5831b939b474dae0cf61c6bad9cf64b0bc80840ba22"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.2/pave-linux-x64"
    sha256 "9001a687933ca8f3fe8ad16872ee4204535746797d833b84edaa94d8cfcae41c"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
