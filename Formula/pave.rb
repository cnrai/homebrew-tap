class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.11"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.11/pave-darwin-arm64"
      sha256 "208165f0d6902f4a288024b4c64f1f0724d7b3c8c74c45be9212887c30cd3982"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.11/pave-darwin-x64"
      sha256 "0d3c62d99486d4aa6b97751c8225f820ef25a0cfb6bfef898f8a44b126f58348"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.11/pave-linux-x64"
    sha256 "fa3ee53145a6073aeb0bd90b4399704a48585fc7f67408c60192165ee1f03a28"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
