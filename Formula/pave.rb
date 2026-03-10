class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.38/pave-darwin-arm64"
      sha256 "8af331e403c7d2c3d0973952ea64df5dab7c7374591a7e5688de9984abe8dbc0"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.38/pave-darwin-x64"
      sha256 "0cb235ddf17ec029ebf9f3f9025c292eb07534690db67ccfd7933d6ea3ec69e7"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.38/pave-linux-x64"
    sha256 "9e0bbdc85561af0ca19d53d7e90d9798c0ccd034eebd60e641a9eb8c55544348"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
