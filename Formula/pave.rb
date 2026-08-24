class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.87"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.87/pave-darwin-arm64.tar.gz"
    sha256 "8f6ecdc9355e0e353965044f246846318ece9dd4ebb9bd0e84fa122dea5f2f39"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.87/pave-linux-arm64"
      sha256 "c6d3545f4fb12208a2cbaf9dc61486ea4dce1ffd1ad98d1700faa13e80fabb46"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.87/pave-linux-x64"
      sha256 "fc3faf90aa3b663d6c1de7c71338e8c3900e802257df04d7649c6d5403185e5e"
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
