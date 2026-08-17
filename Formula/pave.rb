class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.78"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.78/pave-darwin-arm64"
    sha256 "418f1434856e07f18e7550f1050f45bde331ee693c29008253a3cbf393710356"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.78/pave-linux-arm64"
      sha256 "dee15e112c1a54929f92e3919dd6ec172699bdafd7330a444f8f23318924ca3b"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.78/pave-linux-x64"
      sha256 "518a749477e975d1c863a1ca904c5e757242c015dbe245624334a639931e9981"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
