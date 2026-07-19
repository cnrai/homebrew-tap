class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.54"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.54/pave-darwin-arm64"
    sha256 "f1526a82bf5a40ba24e7f2fa12a345428ad0e7e3dbba6e51162a21ba35fcacc8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.54/pave-linux-arm64"
      sha256 "b6b80e4413bfed7c7872fb86951b5f3b51567617a2297128e1af972a149e948e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.54/pave-linux-x64"
      sha256 "d6feb7c20362e6c007dcd76a7d6ade1ea623e712006697c956b3adb63151e35c"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
