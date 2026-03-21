class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "1.12.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v1.12.6/pave-darwin-arm64"
      sha256 "57778b4665e227041bc70663a3e4c5bda724a15b72917b93efd2eb3f9c228c18"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v1.12.6/pave-darwin-x64"
      sha256 "fbef62f73f3746fba821e6de5451edec4b85a287ab5f91f08289800e4bf94e4a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v1.12.6/pave-linux-x64"
    sha256 "84588eb8e54c980aae01b046d517abb22023fa3e3b1b80777d8db17a65d55368"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
