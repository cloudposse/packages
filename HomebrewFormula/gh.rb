class Gh < Formula
  desc "The GitHub CLI"
  url "https://github.com/cloudposse/packages.git"
  version "2.2.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/gh" do
      system "make", "install"
      bin.install "cloudposse/gh"
    end
  end
end
