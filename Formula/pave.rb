class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.104"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.104/pave-darwin-arm64.tar.gz"
    sha256 "523985f1dd9129c5ec893759acdabad4bd5573183e541ddc6236b4e243c353b6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.104/pave-linux-arm64"
      sha256 "40c00f51cafbfb58c416eedcdd99001c80505b43bbebf2c8cec328143ded7dc0"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.104/pave-linux-x64"
      sha256 "c249bb592c23a784f0da708c4c37498b06fc6352a0038e4e34bbcadd3aaa816e"
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
