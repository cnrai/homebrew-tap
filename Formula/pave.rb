class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.11"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.11/pave-darwin-arm64"
      sha256 "58cb918a4bd120bb223a5e260c78caf12b434ac6b5d3f8ed0b11eb3048da8905"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.11/pave-darwin-x64"
      sha256 "5330dac4bd52bc6bd5a4670ad5a4cc003838e91ba62c2aee0e102d8f3f820634"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.11/pave-linux-x64"
    sha256 "5ac732b9843a12db61515bc38653939ffcbed977c4b53211d713182385eb400d"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
