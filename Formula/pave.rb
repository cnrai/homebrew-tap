class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.116"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.116/pave-darwin-arm64.tar.gz"
    sha256 "101b12af61c09be90ff19c97c3f35aec8fca3b6d97e7e9e4a4674f47078cfa73"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.116/pave-linux-arm64"
      sha256 "9eca0d77d070a2d8357f3f28ef556890a2e09b9d65f956d766b78d30b5efa920"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.116/pave-linux-x64"
      sha256 "2e171336eba6e3ef8b8b66e42e30cd9a27f78e9a50d9d0a30efbcdb61eee1578"
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
