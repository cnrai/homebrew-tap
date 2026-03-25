class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.3/pave-darwin-arm64"
      sha256 "99150e91d49255d5c5bf93e071a1871e2dda76e07bc4d02792dbd8452530b9b7"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.3/pave-darwin-x64"
      sha256 "0278234830294e3382fde7c82ff06b489ba82b07866ac22791e967b471c8cc6b"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.3/pave-linux-x64"
    sha256 "50c3689a3bf4311ebc4012151094d1ca915dddfdc7e4cd523bc5b3825bb31607"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
