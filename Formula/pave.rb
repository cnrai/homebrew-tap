class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.63/pave-darwin-arm64"
      sha256 "58f25477284add60ebcf32442ec4727f4ea857f58f0acca37dc07e91188c9afd"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.63/pave-darwin-x64"
      sha256 "73dd07ece427ed98c4b4bb607c7a488e0ba2af0561e641af6cc1d1270ab1b19f"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.63/pave-linux-x64"
    sha256 "69d32de0c07e97e0f4f1f081b256a7336ea9d31f222ae50222916f686ab5380d"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
