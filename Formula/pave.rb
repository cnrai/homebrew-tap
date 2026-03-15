class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.43/pave-darwin-arm64"
      sha256 "2e7a690e4350cc0599c84d0db1387ebc7ab1c876382e27a7228ea4f608215432"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.43/pave-darwin-x64"
      sha256 "9759632267dc46ba783f38d60295653ffbbda5b51cfd0908c3ee3b48a86729cf"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.43/pave-linux-x64"
    sha256 "4d6b6f0c5916a6d74fb5be89f8d11635b8ae843a239fcc9da2c16b4165fad1e2"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
