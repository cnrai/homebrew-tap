class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/0.3.24/pave-darwin-arm64"
      sha256 "ea2e259e851ad75ee718bfbe9e2f8550e06ba101a63f031551eb892844d98416"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/0.3.24/pave-darwin-x64"
      sha256 "7ad6367f8cea0a5fdd44073673a7bf4cdebe7b6c5c532957e23d4527b6b1f4bd"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/0.3.24/pave-linux-x64"
    sha256 "0bf4199fd42825b46517ad84511d8ec0b0d6e220e99942b9ff7ed41b5b18a5e9"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
