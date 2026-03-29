class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.12"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.12/pave-darwin-arm64"
      sha256 "ae3db0acb3163f6326942196902aecdcc03ccb69292b1dcfcc9d9d54be68d071"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.12/pave-darwin-x64"
      sha256 "8f99a94c800a92bcda7e2192443a2c03eb7404dadc48253c7e55f90940aab7d8"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.12/pave-linux-x64"
    sha256 "d5149a0dbb874b4e6065a9941ba34244410d77fc8d488a830ca2b21da8ed1196"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
