class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.60/pave-darwin-arm64"
      sha256 "6f3a30996db5056ed12f9bb05302f001ed5e509117fbd31569cd787cf8e6351d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.60/pave-darwin-x64"
      sha256 "0c027bc4887042bfe0fc989c6cb2a2c571a8fa1bd300352bb94d8d159b6d7d66"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.60/pave-linux-x64"
    sha256 "aec8d8e90d8a92b2d8ad71bf37b3834c5ba2d9593f5f469e337e21864acefd7a"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
