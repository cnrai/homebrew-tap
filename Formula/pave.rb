class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.125"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.125/pave-darwin-arm64.tar.gz"
    sha256 "a29bcf808dfb920d0f4cb7d5c11189c47995a6a7c89f3fccb9992a285b918fc7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.125/pave-linux-arm64"
      sha256 "dac2ffd89afb4cb10a316560207529d1b3ba97b56407d6705708124f5b32f00f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.125/pave-linux-x64"
      sha256 "75e412cad40741ff4d44829f2f5e1bd39f511b49aa3e6182a2bc34102230a9c9"
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
