class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.92"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.92/pave-darwin-arm64.tar.gz"
    sha256 "fbfaf9dc89b75cff0b64ad5297ecb14f812c54abf59619feb2ee3885ea1ca81d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.92/pave-linux-arm64"
      sha256 "516fcd708915406960f21bc5b9eb851189313de98c633b84f4054ed86cd99722"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.92/pave-linux-x64"
      sha256 "83cd202db55fbb8f4a6aff525f4422ed43d66f227c3ac416bfe148566d90398e"
    end
  end

  def install
    if OS.mac?
      bin.install "pave-darwin-arm64" => "pave"
      libexec.install "portable-git"
    else
      bin.install Dir["pave-linux-*"].first => "pave"
    end
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
