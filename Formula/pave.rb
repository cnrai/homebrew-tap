class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.22/pave-darwin-arm64"
      sha256 "148b939a825e2a00bef696945ed75536bc3a5a2ca7de63d1d2b2b87c953a4b35"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.22/pave-darwin-x64"
      sha256 "d5a64c198b7399b0e7294ea0aea39dce0443296cfe9b4ac44f1ce8263fcbef77"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.22/pave-linux-x64"
    sha256 "2d94128699eaf7569534eeb0fe55147f607a31b0075bb835548f1baf1b6a9f16"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
