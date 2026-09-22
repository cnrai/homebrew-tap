class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.109"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.109/pave-darwin-arm64.tar.gz"
    sha256 "fd26522114b6ac07976ee0deae7264d766efa69730a4a1ad03202d2981b16120"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.109/pave-linux-arm64"
      sha256 "e369d7d77a76e989569b7ca145b70ad0fdab0c3e4505cd8ebc00653cb248c82e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.109/pave-linux-x64"
      sha256 "26d87cd8f5889563a36a680e738991d4534341f9b82723f1091b722a0af81171"
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
