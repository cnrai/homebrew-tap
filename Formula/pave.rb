class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.58/pave-darwin-arm64"
      sha256 "e55dd7bbd3471dd330f03a99fc2912e612a3a3b47f069ecf1ecbc876bc8d5d67"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.58/pave-darwin-x64"
      sha256 "495ca2f8d7a8e2c3b0547ceb5104d54736925d467c4433b16a78a2298056be5f"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.58/pave-linux-x64"
    sha256 "41f17ea2b0a93802bde8375097dd433643a449894db0550c21125a5fcbfed639"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
