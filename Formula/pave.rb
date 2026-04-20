class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.16"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.16/pave-darwin-arm64"
      sha256 "8cde913c9c92ec3d5f1d24bfb7f950eb9e4346ff21e1c108c9122ea8747d0ce9"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.16/pave-darwin-x64"
      sha256 "78d9c6babcf515db82aa99d4fc43b8c73f9ce5481c6312310b5986d0a4365d04"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.16/pave-linux-x64"
    sha256 "98aa62a54d00768756a96c05617595a15f86b8beaa543c56ffa28a0d75ed0a30"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
