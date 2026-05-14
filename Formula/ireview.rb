class Ireview < Formula
  desc "Browser-based local diff review for AI-generated changes"
  homepage "https://github.com/suhothayan/iReview"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/suhothayan/iReview/releases/download/v0.3.0/ireview-macos-arm64"
      sha256 "b7dac21a236a356a5500b7a13aef0ab993b7904f22ced875d1506c241aa202ee"
    end
    on_intel do
      url "https://github.com/suhothayan/iReview/releases/download/v0.3.0/ireview-macos-x64"
      sha256 "b51df08dbed70380266e7bcaaf11ec6db0d52ca54e0d1bd526fe430f4f6cefcd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/suhothayan/iReview/releases/download/v0.3.0/ireview-linux-x64"
      sha256 "28a117856e7fbad0d033cb9ffc56e35908468467d64ec8fdc98dd80b48b25f29"
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
