class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.10"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.10/pave-darwin-arm64"
      sha256 "c8e07a83e1456e3cf556b0547a0da9becffa67a8df37a288d16496a736c99edc"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.10/pave-darwin-x64"
      sha256 "615b42b64de7f8f5027d00ec238dfcc1b244fe2abfeb010c6cc5b47ff71ea1f4"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.10/pave-linux-x64"
    sha256 "7d15c958b824da99f89486affdee02d547e6a19ad0f1013876ce7fe226c38748"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
