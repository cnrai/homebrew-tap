class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.37/pave-darwin-arm64"
      sha256 "e218735763b23a8f65f02c538a616cb7d640eba169ffb55b656899c6f49f3172"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.37/pave-darwin-x64"
      sha256 "2a37791bb1f08de8d4fff7129bc0e2343fc13fbc11d5be547e2d9322e755c94f"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.37/pave-linux-x64"
    sha256 "2080825172f813a6771f89c462d272bb8f5e1c162d9b8435a8108a08e746a504"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
