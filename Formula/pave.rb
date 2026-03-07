class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.30/pave-darwin-arm64"
      sha256 "e2a831a5583019ca7667e439dc41f3d00ce70fdc2cec7f18b552c8b197982e7b"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.30/pave-darwin-x64"
      sha256 "1a5d3502ad2ef2419bcd6d3ef83c38236b6428a183894b57762c33c4c5e21703"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.30/pave-linux-x64"
    sha256 "07978c54390972b29c11c769cb6c334da20005b65c37c86ef0e0411069b7f566"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
