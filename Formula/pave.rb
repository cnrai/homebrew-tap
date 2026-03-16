class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.59/pave-darwin-arm64"
      sha256 "43371eed23713090630813fc47594747baef6611bbb189b0938d36a848b892b4"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.59/pave-darwin-x64"
      sha256 "d3a2e7ee51ba96aa8b081b980ebbc819e651a9959c69920de02b95048cbff56a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.59/pave-linux-x64"
    sha256 "5f46dc371ed096f5e48aa1cd7375a1fb5b9a43ac4d2aa1687ceb2a283e75cdc4"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
