class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.96"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.96/pave-darwin-arm64.tar.gz"
    sha256 "7e5197cc50658e536ae88fe7cfdc85d2c71cc62629273f085686d2a1c8ef71c1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.96/pave-linux-arm64"
      sha256 "7137480f58b9bc7f59ea8e3faef3332f4ef777ea928862ec4a7150a5254ab7db"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.96/pave-linux-x64"
      sha256 "b7b750ea4aee1f118f3439a5ed5045e956674b53ea68edddf2381dc7975e3e49"
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
