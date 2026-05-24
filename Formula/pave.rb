class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.3"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.3/pave-darwin-arm64"
    sha256 "90b6c758603e619526b00db35b665b1f6c13e023750daa108459f84d044daa3f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.3/pave-linux-arm64"
      sha256 "53930270af57317dbc4d6ec761c02bec347a0b3fdb6ea22aebd68b41c8b1c23a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.3/pave-linux-x64"
      sha256 "2d889d2c52a40d97732f97dee63396f9494ec45320beae6e6d00f3eed35514d5"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
