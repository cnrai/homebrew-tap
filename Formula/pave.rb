class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.40/pave-darwin-arm64"
      sha256 "452a729a583811788967bf07f747879b48aed873b0f21fff89adb0b9341f1f3e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.40/pave-darwin-x64"
      sha256 "bbb4dc028208e8f46ccd37408763529b07b16a6b2318e8977d8fb8ffe3f4cdac"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.40/pave-linux-x64"
    sha256 "e7d68c08a650523c6dfee97aaa3791c23562d1cc033d974a387dde5238efa6a3"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
