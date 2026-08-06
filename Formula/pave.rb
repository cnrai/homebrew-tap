class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.67"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.67/pave-darwin-arm64"
    sha256 "f2f338241198b6a28dc6893dcbb772a4f7955f77d95d87e01fb1286f6ed1fdc3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.67/pave-linux-arm64"
      sha256 "113f9eb202635606bf9ef886794c95925adb00059cca835b41dbb60289316adf"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.67/pave-linux-x64"
      sha256 "04feffc918a8806c1aaf1cde14e578fd47759873dfa80b8ca712f2965d4c33b9"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
