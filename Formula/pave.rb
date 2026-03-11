class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.39/pave-darwin-arm64"
      sha256 "4b63af4923ec0b64bb5bc080a2dc743f25010d4b8f479627478c1163951c00a2"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.39/pave-darwin-x64"
      sha256 "0e962ef5ea15edaabc3a8811a116288b214948c83ae1332036747d9309c0027b"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.39/pave-linux-x64"
    sha256 "e23bc5a99f897b5d6ffedc1361f7c1e96061d96de84ea7a61ea6dcc183c564e6"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
