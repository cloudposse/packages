class Terraform0.15 < Formula
  desc "Terraform is a tool for building, changing, and combining infrastructure safely and efficiently."
  url "https://github.com/cloudposse/packages.git"
  version "0.15.5"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform-0.15" do
      system "make", "install"
      bin.install "cloudposse/terraform-0.15"
    end
  end
end
