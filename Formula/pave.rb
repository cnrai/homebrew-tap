class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.2"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.2/pave-darwin-arm64"
    sha256 "52da2551b56bbdc05b66e1b10957601a871d049f79fe1e4bc7069c71b4cf2ba1"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.2/pave-linux-x64"
    sha256 "df3e73d1816066eefed464d49ea6fc4ba588973646465aaf1a7427cf76524546"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
