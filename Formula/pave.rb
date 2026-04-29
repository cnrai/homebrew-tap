class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.26"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.26/pave-darwin-arm64"
    sha256 "4481e87cac403d832d37dafcd9437333f7749e071f623f1f8042cc5e3a6ac081"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.26/pave-linux-x64"
    sha256 "7f9fb25bb4eeaaaeb743c587e62809a3bc0c94fe1d70e82fbcdbfb1e616a0022"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
