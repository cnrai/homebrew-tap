class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.24"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.24/pave-darwin-arm64"
    sha256 "c3ea4750835515f15cbafdc3d4857d7f4aaecef1e944c635f0df9d6556943685"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.24/pave-linux-x64"
    sha256 "c02846eb856dc92aa8f01114f13b6fb17d7fb816245691c78fe581b9bf579a0b"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
