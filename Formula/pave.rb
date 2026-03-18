class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.65/pave-darwin-arm64"
      sha256 "9adb93465ea1e11f0840e2f2cd46b9e5b9b5f160b5a87756735d70886a1f8846"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.65/pave-darwin-x64"
      sha256 "8c58cba34f43862f124152cabfe6f307403f80d07d3b695812fb5ad4b65781a6"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.65/pave-linux-x64"
    sha256 "00af9437b30150fb8dc2d85c6a4d566c94892d56f94958e0caeb1ea31afff191"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
