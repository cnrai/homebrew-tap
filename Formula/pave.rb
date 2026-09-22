class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.109"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.109/pave-darwin-arm64.tar.gz"
    sha256 "ac7d7a3e2e8075c6b51eda4da326413cadf9272c199a82d75410e1e3e0d89255"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.109/pave-linux-arm64"
      sha256 "741c610ab904e41f8bdc5ba3eab7f583c2673188572dbb8d11fe5daf44fdc8a8"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.109/pave-linux-x64"
      sha256 "abeab38438e415ef773caf014b847951f855237c7133154d6c4cfc4c0e6ea038"
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
