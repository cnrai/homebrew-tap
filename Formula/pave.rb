class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.14"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.14/pave-darwin-arm64"
      sha256 "0ee7d8164e742c6df2f8dfd7c1e6d919b68516ce21861011dc4c31cffe323169"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.14/pave-darwin-x64"
      sha256 "968ef01c696863ce3567998ae76f6709630173b1a1fbab16cbdb9103ee126899"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.14/pave-linux-x64"
    sha256 "0b29ef3f40eee9d24966802e7ef9e0b877e5c87fe3b5727c061ca752617b748f"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
