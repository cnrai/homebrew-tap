class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.99"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.99/pave-darwin-arm64.tar.gz"
    sha256 "afbbc626a59c3ea39ab034ffbcc8fe7876924b458cf677b776cb097e70b66d9d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.99/pave-linux-arm64"
      sha256 "92053f87f8993d73cc4c44c07ee9d47c9def68060c7c8e950f60e71c343f04e0"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.99/pave-linux-x64"
      sha256 "941ccf087cf72b396a98d5b891a6907645f61be01397a98e72e73d0f1824001d"
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
