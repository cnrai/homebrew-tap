class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.66"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.66/pave-darwin-arm64"
    sha256 "16cb43197a280ce9f10d3741d503c2c7bcb3fb59c6c519c27fa2bc504da1b992"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.66/pave-linux-arm64"
      sha256 "168d50d26be4561bc1cbcdfcd96cd3b48aa43e3236818d96e2f494f613caf897"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.66/pave-linux-x64"
      sha256 "209ca98a6f26b45dba35cb54c81e4d49318bb9b518de4e6c96aca94806447772"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
