class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.27/pave-darwin-arm64"
      sha256 "910728857134b56ab0f5b852da50fc58f82105db2d763c8136e3b3da6a69fd48"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.27/pave-darwin-x64"
      sha256 "4c00bd23189597e49bae9e1e4747a6b3c305ade459e253160a493c1c63380a24"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.27/pave-linux-x64"
    sha256 "ae1258d15da5e633b80a7dcea31ae258176a86676f667dd38194d416cf6d8f17"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
