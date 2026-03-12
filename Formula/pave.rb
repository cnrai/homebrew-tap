class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.41/pave-darwin-arm64"
      sha256 "3682a2a0d5017c2bd4ec73be42e40bdfa13316b12920f8c0e91e6da51f8eb334"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.41/pave-darwin-x64"
      sha256 "5a0dff3cc9b74df926315efad952ce0528bb415eba0ed47ab20a37f605eda411"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.41/pave-linux-x64"
    sha256 "76384a7cbc39fab0e827572ff1a29ccaed0454b92dc672e1dfe3a5dda81c0164"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
