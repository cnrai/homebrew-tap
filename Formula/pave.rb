class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.50"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.50/pave-darwin-arm64"
    sha256 "d0c98a7a1630479edbe7b8173a9b0c1ed42a7c4726c7e7f4bc246363e4be2564"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.50/pave-linux-arm64"
      sha256 "53e38a6cf09d82af003a029e1ad063aafe90b53859f79f24b3fb9b84ec6a9076"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.50/pave-linux-x64"
      sha256 "cc911f6852309251248791889922c79ee95fe6bd8208748c1ce61ccb682ce993"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
