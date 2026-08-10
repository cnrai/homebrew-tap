class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.72"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.72/pave-darwin-arm64"
    sha256 "e56950f0de687e142728770df3b07ad566a2f29bc1809143d769020b6567b376"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.72/pave-linux-arm64"
      sha256 "f8611edf19fc9c79c9778c0b31aa86c12c9ce5a96575c6480959b5b7b93eeaea"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.72/pave-linux-x64"
      sha256 "d5c7ab34dadfa9a11c2bf0a5693284df8f9b8804d987380cffa4c47a3f48de98"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
