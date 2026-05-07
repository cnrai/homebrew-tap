class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.6"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.6/pave-darwin-arm64"
    sha256 "f6bd47a34fc2b364460b2aeca884d51a4cfa2b8805888c520b2b3c47f07b33c8"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.6/pave-linux-x64"
    sha256 "ac4817b7407f7ce350f791454e07d3dc3c7c3d58dce50e5d0b73de2b0c80968e"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
