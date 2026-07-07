class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.30"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.30/pave-darwin-arm64"
    sha256 "500cdc5f9800f243089c540536920d27e9e0860c48794290ea1d5c224262c72a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.30/pave-linux-arm64"
      sha256 "e8717725e13689631872ba515d4b82ddc298732c67d30634d06074828fcac053"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.30/pave-linux-x64"
      sha256 "b8382ababbeac5e44408570d9e0b319688f4f6e7f019a8c4544cd385a2635da4"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
