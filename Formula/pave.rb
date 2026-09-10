class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.105"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.105/pave-darwin-arm64.tar.gz"
    sha256 "a811453701c9fd4e3787ef3446227e61849e7a995c8b07a0a52a0931d77bd098"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.105/pave-linux-arm64"
      sha256 "717e8c40578da996ba655f6cfd99daa2ac9834506eb465efcd254b6e158f175a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.105/pave-linux-x64"
      sha256 "b3de0dc94a0d7da4ef6a377481173a379e41a820c1cedb34ac49420b129c24bd"
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
