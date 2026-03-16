class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.56/pave-darwin-arm64"
      sha256 "757ecfa884b1a5fe204a0b53c18f7cd37904f265a5df8c036514ca8ac681878c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.56/pave-darwin-x64"
      sha256 "3a93ae9292e347f33002ed19d91ddfc1b71b6d4eca5fdb1e78455018e34e7532"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.56/pave-linux-x64"
    sha256 "c1a2c2c50fc24e436ff6d914d3fa0882d6510e0ccdcce34d5c2a3d6af9c97522"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
