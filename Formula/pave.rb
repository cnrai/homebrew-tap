class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.93"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.93/pave-darwin-arm64.tar.gz"
    sha256 "2469ca6022569b1987351cd76bbcf52989e8628cb81e7876d493d1331bff29d8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.93/pave-linux-arm64"
      sha256 "e9ad5778a540adb3cb3f98ccb7709dc9f76077fe3c311de0086237d6912688b6"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.93/pave-linux-x64"
      sha256 "a739a6a751bd53e6719ee82f5449961beffcf5190f0a9ee78ca7672f5fe49b3e"
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
