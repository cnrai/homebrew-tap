class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.31"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.31/pave-darwin-arm64"
    sha256 "3809f8a7dbdca5dc5299bd969709843a0cd0679b25146e59c5e0a549bf4d480c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.31/pave-linux-arm64"
      sha256 "f78a9b5e41975c509bc21c8b67be3eae7c614a71a7569d1124d1dbceb6169795"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.31/pave-linux-x64"
      sha256 "1f693cd8fd3e81eaaf1bac75f6a15a76033619645a03a49831750a0d7f71627f"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
