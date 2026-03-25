class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.4/pave-darwin-arm64"
      sha256 "e6bb569d402421a3bdb71f17a8b08ec2b62284a8d699a44760f89bc195e3e6a2"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.4/pave-darwin-x64"
      sha256 "a63496ab962b650142256170d73f2642fc41df9ab0ae89419685cf1b466b8465"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.4/pave-linux-x64"
    sha256 "d81ab7f803021d2877fea387aa7b3349d6ed52a0bd46faafa16bf2bc7ac4628c"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
