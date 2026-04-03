class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.29"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.29/pave-darwin-arm64"
      sha256 "653e7e98cec4e61b6edde30c691986abd41b3a9e3ccf87981fd1620632b75fb5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.29/pave-darwin-x64"
      sha256 "b127c5767fcb40c1088296b57ba69159a00d027a919b78a6b87a55c8add6b1ed"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.29/pave-linux-x64"
    sha256 "4bd9398b55088e1546faa5e68302973deae13f53748ac96428a70ed6166490d2"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
