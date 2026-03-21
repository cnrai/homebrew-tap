class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.4.0/pave-darwin-arm64"
      sha256 "62aa2fc029ce86d60d5f2cd855cacde4fd558702cc7b2813aa73ff0e1e649180"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.4.0/pave-darwin-x64"
      sha256 "df3c6f0a9450c980ff923bc27073a354f3794ab1d232eb2a835d811551822c17"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.4.0/pave-linux-x64"
    sha256 "201e97df5fd3c6a3840bea0478727c8057d5974ebed98dcfc7f8e672410256e9"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
