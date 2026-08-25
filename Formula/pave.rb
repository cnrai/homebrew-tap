class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.88"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.88/pave-darwin-arm64.tar.gz"
    sha256 "ebad3a128c8bc991ee6b0808e85308afcec535b54b85ef161d1849623a41a63d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.88/pave-linux-arm64"
      sha256 "9e8c849ce9308246438ceea569c2f0361d4cd307cfbf987ffedf1af12d97d8f3"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.88/pave-linux-x64"
      sha256 "4049b6a55624797f2ea887b595ce4d90945d60c7ee3e9ab3fc35509c0a45f1c5"
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
