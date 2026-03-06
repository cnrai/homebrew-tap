class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.29/pave-darwin-arm64"
      sha256 "47b609a1498a9d6245cf3f0f0415613bfad07917e6a435b9bb530aacffd08f7f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.29/pave-darwin-x64"
      sha256 "167aec67dd5ef23e35a05248f53d3294be83322cb724a69ee811592ce9f9a326"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.29/pave-linux-x64"
    sha256 "a4defc47260b1f518f666789813c03ad723047b29bba244ddabb82ac33416ee7"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
