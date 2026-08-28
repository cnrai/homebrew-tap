class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.97"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.97/pave-darwin-arm64.tar.gz"
    sha256 "10b8779878f234c0caff38be515e8874faf1061d4d8997324ff29a0873a5b28e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.97/pave-linux-arm64"
      sha256 "2ab71bdf92312d85352dc84c17241cbd35f53a135ed4b00308b544ad31e7f6f2"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.97/pave-linux-x64"
      sha256 "5f4f852c2cba9046ba3a18a6256def7e545c41a3c60fcd35273bc7273159b23d"
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
