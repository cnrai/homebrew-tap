class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.18"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.18/pave-darwin-arm64"
    sha256 "8885b0327e4756bedbeccffdfd96974570a597f5ed84f60fa7c945264ca67f86"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.18/pave-linux-arm64"
      sha256 "3c34ca41a8cdace65c6fea3677eac306054689c56b6c4699f3600c154a4caf4f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.18/pave-linux-x64"
      sha256 "2f16b169d4731bfbf9c8106218f0e80f907b1503f8bfa69daf742a777bcbe521"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
