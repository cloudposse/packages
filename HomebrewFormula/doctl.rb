class Doctl < Formula
  desc "A command line tool for DigitalOcean services"
  url "https://github.com/cloudposse/packages.git"
  version "1.67.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/doctl" do
      system "make", "install"
      bin.install "cloudposse/doctl"
    end
  end
end
