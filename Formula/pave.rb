class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.18"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.18/pave-darwin-arm64"
      sha256 "24c5a2dea1733a4b86f8d560936f1d278f9da2a86f3f79fc13800935d0b2fe34"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.18/pave-darwin-x64"
      sha256 "f57c9f7d19a63c0faf6b29364f21718728c1d49c65f97d2f2e7b7a165aad8482"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.18/pave-linux-x64"
    sha256 "89785618edea6959be3af4e86d5d48eb9111f14748d08b8ac5b55f4a4497c9b8"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
