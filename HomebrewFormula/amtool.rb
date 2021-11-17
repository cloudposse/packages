class Amtool < Formula
  desc "Tool for interacting with the Alertmanager API"
  url "https://github.com/cloudposse/packages.git"
  version "0.23.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/amtool" do
      system "make", "install"
      bin.install "cloudposse/amtool"
    end
  end
end
