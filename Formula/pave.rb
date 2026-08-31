class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.101"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.101/pave-darwin-arm64.tar.gz"
    sha256 "09bb5f17e576042023d3c783b185ae2db434b12f18eb4a83c97a4c29c56aee5d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.101/pave-linux-arm64"
      sha256 "0e1caa5ee261c8eaa90c867e9114add85551310543dfd8255d98be6359d58071"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.101/pave-linux-x64"
      sha256 "9d0a298ce632e6ffb5ab2cc5d75286c3f5d7e1e7ee3fd57720c31649bcf1330a"
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
