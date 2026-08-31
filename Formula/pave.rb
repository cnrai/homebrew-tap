class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.100"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.100/pave-darwin-arm64.tar.gz"
    sha256 "ccdf7c4a141a46cbc0ebb307c46c418ef21137862be6821e39df8c0f124ea27b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.100/pave-linux-arm64"
      sha256 "dcab57acbbb6cca081e087ac36aa0e6ba5d514eab3e83b905c62959f4b1b96c1"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.100/pave-linux-x64"
      sha256 "2494bb77181f5dcfc89e744f9503446aed88421b861558f854f561006ded6518"
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
