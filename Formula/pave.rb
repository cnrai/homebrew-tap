class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.64/pave-darwin-arm64"
      sha256 "15799f6e0e16504d56e6532f8472e5edfe536c0310b490bee382e76d700f2131"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.64/pave-darwin-x64"
      sha256 "2befde30d2d004b87b3ede3a5f9fda1b43999a062708fc85865684417867b639"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.64/pave-linux-x64"
    sha256 "ccd45716d7f31b0edd67b4856806b561a67a77b90f47795dc3126a9ddad585b5"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
