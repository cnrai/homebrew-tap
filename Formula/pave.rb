class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.39"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.39/pave-darwin-arm64"
    sha256 "edcf721e14df8eff11cbb332c095eef85dfaafd29bfa13a7cabba83b9e8943ed"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.39/pave-linux-arm64"
      sha256 "67be2bf540f4e0e509e693d7ed9d0c8c6b4585ad5c948670a09fcdbfcf5fb1a1"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.39/pave-linux-x64"
      sha256 "e5c41e98de5a9a07a95ff036f935038df8223795694a6b3d7201c954ee322500"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
