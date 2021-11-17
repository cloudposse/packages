class Scenery < Formula
  desc "A Terraform plan output prettifier"
  url "https://github.com/cloudposse/packages.git"
  version "0.1.5"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/scenery" do
      system "make", "install"
      bin.install "cloudposse/scenery"
    end
  end
end
