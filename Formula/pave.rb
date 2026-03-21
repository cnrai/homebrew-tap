class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "1.12.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v1.12.7/pave-darwin-arm64"
      sha256 "0ae1db1c9cba5a8d02cb0f0f4b8abb8cdf9fa84c469c55c863844a540f82e9d7"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v1.12.7/pave-darwin-x64"
      sha256 "0e5ec00a7b1e3c6b27f9bd9672b8bde19e2d0950a385052ca37722c73007e688"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v1.12.7/pave-linux-x64"
    sha256 "f84852bbeb1db67b7c2aba56ce0a922bb2fbab5024b105c45d271474a6e76b08"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
