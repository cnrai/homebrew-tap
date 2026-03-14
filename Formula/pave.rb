class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.42/pave-darwin-arm64"
      sha256 "35b5e1298f08699c724581954d0e2cdd672995c0a1d51215ad86ee24d6d81bb2"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.42/pave-darwin-x64"
      sha256 "fdb4fd3f56639840b58e214b151bc7a603d920627d4dc1135d3ca2f90ca5f2de"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.42/pave-linux-x64"
    sha256 "fdf76d9dc3a4dd91e874d77818aba2e1f23aa916cfb0e658ef7b3185470d8261"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
