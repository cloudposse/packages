class Ctop < Formula
  desc "Top-like interface for container metrics"
  url "https://github.com/cloudposse/packages.git"
  version "0.7.6"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/ctop" do
      system "make", "install"
      bin.install "cloudposse/ctop"
    end
  end
end
