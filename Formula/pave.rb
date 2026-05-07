class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.4"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.4/pave-darwin-arm64"
    sha256 "1a17d2777636c1b4a1ae8f9a30e4c9bbf90c0414cffd340251cf5614b2836aa4"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.4/pave-linux-x64"
    sha256 "b112d75b030aee4316713567f557485e256fcfc931c1f56b7b00c5ec05de042d"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
