class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.20/pave-darwin-arm64"
      sha256 "090f0d22a91c7b5a92bf4258eb28a1703f3e982c9baddac0f1c21e7eb593180a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.20/pave-darwin-x64"
      sha256 "f4b054f7be5fc07ecb5d50e4ea6303fcb2d600b83d0865d2ceedc2e15dbdd3d8"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.20/pave-linux-x64"
    sha256 "8475270fff11b4e240a4cd9766d33aa58b6efd09eb5a0fc04975d9ce8a377408"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
