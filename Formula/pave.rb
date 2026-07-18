class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.49"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.49/pave-darwin-arm64"
    sha256 "a6f6a5bd6def24d53d4ba30997dbf08d43ff6b5058e2d0f6c9ef3c983a2f31c5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.49/pave-linux-arm64"
      sha256 "0fac364f77b0b50b00b0b72226963c00d138e538aa7c750a933962d93f09c292"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.49/pave-linux-x64"
      sha256 "6c613e5aaad848b68301d5beb07dc6385d867835c23e8f138e042b2e024e8d3d"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
