class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.57"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.57/pave-darwin-arm64"
    sha256 "4f199116ba719cfcb62d4f4f4d1f59f7c31f7104bbda1d4695de2739f3a5ecca"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.57/pave-linux-arm64"
      sha256 "ca8a893b39b69eba8cfc2aad883d6905bd729c04c35b017262c7b1b7fefa51ed"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.57/pave-linux-x64"
      sha256 "2f638004be0a440a3522b722b5672578b37b0afb3d2ccc3629a3a7b46d406f16"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
