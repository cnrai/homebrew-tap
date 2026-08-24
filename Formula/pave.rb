class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.84"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.84/pave-darwin-arm64"
    sha256 "06279f7efd4af205392dd2636540f1877c3b3a4d43417566bf1946d45bfd2744"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.84/pave-linux-arm64"
      sha256 "1c14915f0c12fda532af6e646ebcea3c55a4565171e56d921757a5a69fd4124a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.84/pave-linux-x64"
      sha256 "530ed8d18ba0abfc378bcf9ce1ff8e751bf6c0f1abec7a384e90d06f062c0b34"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
