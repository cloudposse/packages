class Ghr < Formula
  desc "Upload multiple artifacts to GitHub Releases in parallel"
  url "https://github.com/cloudposse/packages.git"
  version "0.14.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/ghr" do
      system "make", "install"
      bin.install "cloudposse/ghr"
    end
  end
end
