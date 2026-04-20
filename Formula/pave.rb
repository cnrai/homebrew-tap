class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.19"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.19/pave-darwin-arm64"
    sha256 "c89bae1f46cc0109c0eba2ca3037d3b50e280deba43b86da1e76f930324acb6c"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.19/pave-linux-x64"
    sha256 "e45042d51ebca721e71041e28a149c06b229d7fac9f086be667e89e7533dc657"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
