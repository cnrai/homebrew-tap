class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.110"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.110/pave-darwin-arm64.tar.gz"
    sha256 "a1c0b1af487faab3c5f7b8fe11cc9164473722a2678fcef1a4aca2f9edc4348a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.110/pave-linux-arm64"
      sha256 "c7ba97e27766ea3805c7b5c58bec234415f3384911a09aa25e39828e97182b6c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.110/pave-linux-x64"
      sha256 "a94649f44fb3b66a0361a3ee1135986f4674f218760ef7182dbd66efa292ef8b"
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
