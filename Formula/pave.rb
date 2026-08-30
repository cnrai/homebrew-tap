class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.98"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.98/pave-darwin-arm64.tar.gz"
    sha256 "16647188ac58c60f4af3e7328aa534f43b17587908f3e55b1f82df3857127c88"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.98/pave-linux-arm64"
      sha256 "5e2c92c330f01a579f7d279f96e0a367203a7f50165205e621e2054aca48a2b1"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.98/pave-linux-x64"
      sha256 "8a48f77761df2ad5979b54fa8ed95260850e820a1e6ea625821740c8fd352518"
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
