class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.44/pave-darwin-arm64"
      sha256 "cf008a8a1a3940650c01c097049099160d9a7504c85f1275246eaee434b7d38e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.44/pave-darwin-x64"
      sha256 "6f03753a997c21a45416dae7901770ec799c4d9c6c881bbe5da37c215b090b5f"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.44/pave-linux-x64"
    sha256 "c8625acdf0b7f5e2c0c5947fc5e937924098004c920162c406000c0a0ab05311"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
