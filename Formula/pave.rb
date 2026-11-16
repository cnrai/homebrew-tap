class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.124"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.124/pave-darwin-arm64.tar.gz"
    sha256 "f650be24598df213324ff935bb920cf1116d0884a49b8533e47ae96cc3990ce5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.124/pave-linux-arm64"
      sha256 "5a988f5bba51d859d691102adae72004640cf552415dfe3b8d83b3c17497d6b8"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.124/pave-linux-x64"
      sha256 "32becf91f5522f34e2918dca5a34ac7965d3ec95937131f1c0380a2297a8f5f9"
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
