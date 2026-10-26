class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.117"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.117/pave-darwin-arm64.tar.gz"
    sha256 "62c15ed87d223a2a68a1b77c7935728b8ae3348af5b3ff2885a54cf85ddd52c4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.117/pave-linux-arm64"
      sha256 "d95f02ae03e97f338d4ca7e14e013a9d3d3ca18ef3b4a985d0761936f83490f0"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.117/pave-linux-x64"
      sha256 "00d832f4b81587aec38d53e17f9107f0203e2fc70990cb70ee164b85e7537bcc"
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
