class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.111"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.111/pave-darwin-arm64.tar.gz"
    sha256 "d9cd10254f9c4f269aefdae33205e969499854c84dc1381503bf5a13077028ef"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.111/pave-linux-arm64"
      sha256 "a82786acda51218602adcfc3b2e0c82a9fda2b1ba472cfe97031bc941d20f349"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.111/pave-linux-x64"
      sha256 "b6825e2daa926bc72fa3f23a79c2f8034a39f267125921374221ce88b4a770cc"
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
