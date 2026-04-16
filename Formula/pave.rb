class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.1"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.1/pave-darwin-arm64"
      sha256 "69198d03df8ebfaa4af02ecb52781625d2631a336a9770f8f8faf242b33e7c63"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.1/pave-darwin-x64"
      sha256 "349c7dae9d1cc175f8a8f949cf5b85fea68fb8d764863c05e45592eaa0ae877f"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.1/pave-linux-x64"
    sha256 "9e8aca1c74a7ec4b012cc5426404305efc4ad0f351aa2f93156bc680f6c95e4d"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
