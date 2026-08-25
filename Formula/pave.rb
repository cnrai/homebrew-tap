class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.90"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.90/pave-darwin-arm64.tar.gz"
    sha256 "3d03ea2bc237ac97302404d8435f2b685e4994395ebb19fc05c95afea3e20fea"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.90/pave-linux-arm64"
      sha256 "76c05f47e1e5c175a7e06643c4d3a51753699d13487037bcd39ef13bff18c17c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.90/pave-linux-x64"
      sha256 "047aa8c5698bd0cf46d3ece407c724f5fcf19dcecc1bda4e9ea0dd844ea7eae3"
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
