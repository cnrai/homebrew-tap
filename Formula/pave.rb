class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.18/pave-darwin-arm64"
      sha256 "4df12105988dc827e08ea2c5363c81641039f982b92d177317192fe37d9a3709"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.18/pave-darwin-x64"
      sha256 "ecd2dc1b81bb641918f718634945da5c7f1dd3cb1adcc3c586068a7e5efdde63"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.18/pave-linux-x64"
    sha256 "31374663d0ff695d2ee3b0263d748e496b97ba681c78b1bfad0c0bd67348356e"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
