class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.85"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.85/pave-darwin-arm64.tar.gz"
    sha256 "cf6ceaf62eb1c2760059ca84595642c305d386088d629b63d517fde3a7a08014"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.85/pave-linux-arm64"
      sha256 "0312da8396a66dd92df0dde1f24866e16782e8829c6614d3c138d88dafcfcfdf"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.85/pave-linux-x64"
      sha256 "623f7357c3115721cfcc478268a3191f76944311b80c111db9cbbbb7e2c4e159"
    end
  end

  def install
    if OS.mac?
      bin.install "pave-darwin-arm64" => "pave"
      libexec.install "portable-git"
    else
      bin.install Dir["pave-linux-*"].first => "pave"
    end
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
