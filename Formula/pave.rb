class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.26/pave-darwin-arm64"
      sha256 "f20dba477963cd4acb2a2ad47516509cc96c2b1adb160e10a6631a1bece235c3"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.26/pave-darwin-x64"
      sha256 "2454ccc033177a732807e0ed6f46af688d1abff076260545a9e24c1d29eea87a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.26/pave-linux-x64"
    sha256 "62196dc4f0dba1da3fd5d6cdc4d30e88391672347b5042f4134f7a3319776a57"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
