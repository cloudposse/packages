class Atmos < Formula
  desc "Universal Tool for DevOps and Cloud Automation"
  url "https://github.com/cloudposse/packages.git"
  version "1.3.9"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/atmos" do
      system "make", "install"
      bin.install "cloudposse/atmos"
    end
  end
end
