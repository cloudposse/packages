class Terraform0.12 < Formula
  desc "Terraform is a tool for building, changing, and combining infrastructure safely and efficiently."
  url "https://github.com/cloudposse/packages.git"
  version "0.12.31"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform-0.12" do
      system "make", "install"
      bin.install "cloudposse/terraform-0.12"
    end
  end
end
