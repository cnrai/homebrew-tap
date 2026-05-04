class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.0"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.0/pave-darwin-arm64"
    sha256 "05432e5cc80ff4057610fc0a498cb4c94f18fdab4794e20cf6f2a77d5b0d152b"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.0/pave-linux-x64"
    sha256 "0b53ada12a675b0fba7b5157d7e4a2655519e1068c9de87c8591d8eddf3b2fbc"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
