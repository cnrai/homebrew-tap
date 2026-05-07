class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.5"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.5/pave-darwin-arm64"
    sha256 "68bd5596eac2934086fc8af8764617d16e5cee2ec1566a5db5a100fc7b437818"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.5/pave-linux-x64"
    sha256 "9f7bb882610b5d0e589efcbf016e91c5ef98305f86e554669e502eb3a9b48f89"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
