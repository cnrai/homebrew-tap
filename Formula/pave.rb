class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.16/pave-darwin-arm64"
      sha256 "9312312225d49576a08a10b30642e4a324e58c354035d63e3f0d21d2e749ff99"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.16/pave-darwin-x64"
      sha256 "cfa278125957ef2469426f7ff94eaaf83449a600ff018e463189d65c0f99ede7"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.16/pave-linux-x64"
    sha256 "95814918c1d93c059e73ea3bf767f93fa38c22e507ec979d8404e4e8f0ea82b6"
  end

  def install
    # The downloaded file is the binary itself
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
