class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.0"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.0/pave-darwin-arm64"
    sha256 "ada2a8c0f8e19fe45680198e378cf802eeb9e26d339ba0788540ddde5ccac2b9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.0/pave-linux-arm64"
      sha256 "9da83792c9a52b744980ab26d1d66a427ee0562587506e07ef07e8420d012b75"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.0/pave-linux-x64"
      sha256 "4121a4a9933449d988c1aa0bafd9febd8c1ff426008851778cbddcaa75b9f1f7"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
