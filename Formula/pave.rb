class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.23/pave-darwin-arm64"
      sha256 "ee20d036ec1775cf2239d839d10a1cd0c764c9e33943c4371072bb912cafc85c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.23/pave-darwin-x64"
      sha256 "0f9790b0ecc18e14fc7dea072c5dc3b9c834b01e0d52bab8c33f38fb6fe3d53c"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.23/pave-linux-x64"
    sha256 "44d337ceb222edc794d3b242ea199a71beb1f857762fc267393537ebf4c9b74e"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
