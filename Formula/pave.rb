class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.15"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.15/pave-darwin-arm64"
    sha256 "3b064de18afda537df2b86bab7142081e088595a3783ce38001aad749d0cf548"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.15/pave-linux-arm64"
      sha256 "962daeb1af5a6b38671330866ec04dced308dc7b54a39fee8656fe3fb36a858a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.15/pave-linux-x64"
      sha256 "922aeb7d782de5464ea75891ce1190697ba55833c03f33a3f4184ec37c14bb85"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
