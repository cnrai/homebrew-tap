class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.26"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.26/pave-darwin-arm64"
    sha256 "88e7b255b96865fd7746111a1c0a65034ef271b514f520186fa5c2475bd78b83"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.26/pave-linux-arm64"
      sha256 "d3ffbbfceb805434b6378efc71d4a16daf511e6d96632c09f59368c2423db7a4"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.26/pave-linux-x64"
      sha256 "3df828ae55a97a3cd8a5960cdea7c80c9288964e0089c070edf3058433a9153f"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
