class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.95"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.95/pave-darwin-arm64.tar.gz"
    sha256 "23153fcb3c51d6dffa4e032a43f5375b9ef398000698d9def59c75a3644dc551"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.95/pave-linux-arm64"
      sha256 "6930f55dfd273ff24ee72b1eb8afd79baa2e5a9c88f65da779e0c2a29ff2cc10"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.95/pave-linux-x64"
      sha256 "04a80c64d7a69b40d5f4dddb93fc61db4a672eaf37c89016da2d5f7cbc6b9b2f"
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
