class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.108"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.108/pave-darwin-arm64.tar.gz"
    sha256 "6279d06b089447e48cbf44b7d382032bea96b99c645ee76672491b29e70ae642"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.108/pave-linux-arm64"
      sha256 "b467fbed48eb6e8876c2e82263934bafb79d134de0699d8f237b0382ec02c4a6"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.108/pave-linux-x64"
      sha256 "08956e9af41c8c004b54976d40fcdc35d79833ed7af89de1c700e476c689c144"
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
