class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.102"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.102/pave-darwin-arm64.tar.gz"
    sha256 "78ee0c5e2e0de1b521b092dcc98fbf43a027cf213df10a970ca0192db649f5d5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.102/pave-linux-arm64"
      sha256 "c35b6bad937e1f0e19112a45e3cc975853bdd7cff647fa52f4d25e609d87fd7d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.102/pave-linux-x64"
      sha256 "3e5261ba25d69c4311d89f9c547063cd2f0adce01781f3c322de1cbebe18834d"
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
