class Envcli < Formula
  desc "A simple wrapper that allows you to run commands within ethereal docker containers"
  url "https://github.com/cloudposse/packages.git"
  version "0.7.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/envcli" do
      system "make", "install"
      bin.install "cloudposse/envcli"
    end
  end
end
