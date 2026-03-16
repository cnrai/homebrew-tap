class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.52/pave-darwin-arm64"
      sha256 "87a219d9f4e2613e63daa79a00f17f67ea6571ef488868eaa4ef355cdf98c498"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.52/pave-darwin-x64"
      sha256 "7fba25def3097c39fc6f307ca3b4ccbcd4b533a7a6357a8f3d713db02a951e04"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.52/pave-linux-x64"
    sha256 "421df5bcae1708d53d70bf35c4100bd79cd377f8a90b9a09f59941356eea3420"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
