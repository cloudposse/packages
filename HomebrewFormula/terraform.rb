class Terraform < Formula
  desc "Terraform is a tool for building, changing, and combining infrastructure safely and efficiently."
  url "https://github.com/cloudposse/packages.git"
  version "1.0.11"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform" do
      system "make", "install"
      bin.install "cloudposse/terraform"
    end
  end
end
