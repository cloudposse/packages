class CloudposseAtlantis < Formula
  desc "Terraform For Teams, enhanced by Cloud Posse"
  url "https://github.com/cloudposse/packages.git"
  version "0.9.0.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/cloudposse-atlantis" do
      system "make", "install"
      bin.install "cloudposse/cloudposse-atlantis"
    end
  end
end
