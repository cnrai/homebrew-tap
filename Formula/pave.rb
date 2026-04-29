class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.27"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.27/pave-darwin-arm64"
    sha256 "162c299010bf7997cb552b6bb3aadb5fc2b8f7bd81a5fb6f1b6f352f86ee4fca"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.27/pave-linux-x64"
    sha256 "7cb14d485493f1c395a57e3e5d2f05edfd43e3f503b33a32525ae2e50d8d91f5"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
