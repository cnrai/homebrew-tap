class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.80"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.80/pave-darwin-arm64"
    sha256 "d9f9cb52d383a46f70bec83020d1812aa50cf4869ecf202ee93e86babeddf8ff"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.80/pave-linux-arm64"
      sha256 "beff438a6cd24e2d24bbdb54c6e6a5037cecf90864d13ce2d23e1a5474ddee7f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.80/pave-linux-x64"
      sha256 "e0b444ab89487f4ea50d8adf909cbdbae9d0a253e7ad980d5330a09ae0577bcd"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
