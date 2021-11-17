class Tfmask < Formula
  desc "Terraform utility to mask select output from `terraform plan` and `terraform apply`"
  url "https://github.com/cloudposse/packages.git"
  version "0.7.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/tfmask" do
      system "make", "install"
      bin.install "cloudposse/tfmask"
    end
  end
end
