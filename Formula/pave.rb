class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.36"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.36/pave-darwin-arm64"
    sha256 "2dc80074c6adbcae030fb7b7a99d93aa24781b9bfc5dddb9277af9e5e99b18b5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.36/pave-linux-arm64"
      sha256 "878e0fc38d7ca05c4f89211282a4ea2d361e2b1814be5127a7078699488fae69"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.36/pave-linux-x64"
      sha256 "1f1624112bd9c8e69bc5ec59fc71044fdff61999c1d33cef96de0c085e71985f"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
