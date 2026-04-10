class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.8.2"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.2/pave-darwin-arm64"
      sha256 "e5590889f17e38c161453157638af9cf515702ffe0f9a487e7efdfa95bd47157"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.2/pave-darwin-x64"
      sha256 "a6fa7d3dc94d20d93a130b085c2ef75c79bc1cd057de22d05f6573564f862d0b"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.8.2/pave-linux-x64"
    sha256 "8f99b17e95b6054be9ada8fd297616a15db2ce5c6b0d393a21554d639bfba775"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
