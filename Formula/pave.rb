class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.0/pave-darwin-arm64"
      sha256 "7bb1075c92174966b0c03e0b334b4c5abe25b6bc7b7c6167d851cda091e1f138"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.0/pave-darwin-x64"
      sha256 "5fcb1ef9fc20f6cffe9903e7a7af1ff8ad052c9b7251949ab3b9fb5e41b7d162"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.0/pave-linux-x64"
    sha256 "f51a7bf54099a5d90c1661666421302d18350f21a185b39ef40d7e0d834f89d5"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
