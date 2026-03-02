class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.19/pave-darwin-arm64"
      sha256 "c7a45917f80877c5228774e68e26c55a2637d9e01921fa46b55b184e279a88a5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.19/pave-darwin-x64"
      sha256 "9c8dcaf2b900f9c77919af181c3ab31a42166f51432324cc61ea6dbdf7e6cf17"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.19/pave-linux-x64"
    sha256 "6436b6b28e840ec73ae53aeed996ea5e1c0630a36e0feb31b8794c31798cdbe3"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
