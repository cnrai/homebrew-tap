class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.43/pave-darwin-arm64"
      sha256 "559cea7d167dcd21c8481d52e9e989ff079458714c230145b16c6ad13bea3928"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.43/pave-darwin-x64"
      sha256 "a7768c9d59b4ecb29e128239875daa9dcb05829e01aa11cf581ba65d0ecc28f9"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.43/pave-linux-x64"
    sha256 "1d061cf2ffb7ed704878b637927bfac3e649204a95861e2c9e6e95fc932f334b"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
