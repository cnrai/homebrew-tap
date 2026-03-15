class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.45/pave-darwin-arm64"
      sha256 "829721885b8d3a2422dbcc2eada3e8c5f12968389ba049ea3b2261792bfa5824"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.45/pave-darwin-x64"
      sha256 "a0a21d5c613b84255761f85139f1dd750c2e724a9d4196f6b93d8578292ba2d5"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.45/pave-linux-x64"
    sha256 "19b41a8166d677a4b1f3ef9fb99fe248f3e717f9fd700cb795a6d6f81c5ee92d"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
