class Ireview < Formula
  desc "Browser-based local diff review for AI-generated changes"
  homepage "https://github.com/suhothayan/iReview"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/suhothayan/iReview/releases/download/v0.2.0/ireview-macos-arm64"
      sha256 "230c43726f71adb1a23d8abe497197f779659f29f6c54cc3675f72770d42f1c7"
    end
    on_intel do
      url "https://github.com/suhothayan/iReview/releases/download/v0.2.0/ireview-macos-x64"
      sha256 "7a0242eac61ca0812ae1978377ae751157a27773d5742484a7d36988b6400e5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/suhothayan/iReview/releases/download/v0.2.0/ireview-linux-x64"
      sha256 "8561a4a8c15c595d7ccc11e23060bb9809cef4c13f751ab8dd05a6b86c251d7d"
    end
  end

  depends_on "git"

  def install
    binary = if OS.mac? && Hardware::CPU.arm?
               "ireview-macos-arm64"
             elsif OS.mac?
               "ireview-macos-x64"
             else
               "ireview-linux-x64"
             end
    bin.install binary => "ireview"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ireview --version")
  end
end
