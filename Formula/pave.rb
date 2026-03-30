class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.14"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.14/pave-darwin-arm64"
      sha256 "1a56d0d16dbeab43a3895f4d7693779fcd3e5be74027b712e5cdf7229421f0b5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.14/pave-darwin-x64"
      sha256 "c05d51d08c2ab648ed850ef17da69b5ae38998e2f6f311aed525de67bcde99e4"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.14/pave-linux-x64"
    sha256 "2da4ce076ce80014a46381be533c54eea83f95a999420883e5decef10f65a695"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
