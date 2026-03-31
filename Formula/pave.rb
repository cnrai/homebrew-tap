class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.16"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.16/pave-darwin-arm64"
      sha256 "f210f85d3e1cb2d710186c61a3ed962c01a948fcf9b5fac12dae7106a3fb18e4"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.16/pave-darwin-x64"
      sha256 "5d85ef8050dc420487f24715f9cb5bed51454971f7ecf8dae3b1fa7e23c91042"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.16/pave-linux-x64"
    sha256 "115b7f7dbb96d572891ea4dfa4ae96171944183c1f0b22316f6f2f5bba56f916"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
