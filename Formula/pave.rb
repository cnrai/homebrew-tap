class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.86"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.86/pave-darwin-arm64.tar.gz"
    sha256 "25ad02dc21105a49f3684adfbfba451e8f00311378bace8bbd99bbb2ebc7111b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.86/pave-linux-arm64"
      sha256 "5390a767d5f1c77d9dce16837b46031cd788d699119c6cd76ae7ee1492726941"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.86/pave-linux-x64"
      sha256 "4d9a38bb79e33564a9887cea90efc875b443650a500c73099eda7ed4d0e7a6d2"
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
