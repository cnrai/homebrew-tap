class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.4"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.4/pave-darwin-arm64"
    sha256 "d7cd9b64f04b6a02315d22b16d044f02da57f80a16296cf5ecfecf20cb69db75"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.4/pave-linux-arm64"
      sha256 "9ea708635209bb0b3ec3e4421ccaeb3f3b32c8e77ed37ddecda7ea9efb745f2b"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.4/pave-linux-x64"
      sha256 "622354b92fb065416512b3460a5fc24178a47bedcfba2307cb120fbcd3a363a4"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
