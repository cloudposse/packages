class Terraform_0.13 < Formula
  desc "Terraform (Deprecated package. Use terraform-0.13 instead)"
  url "https://github.com/cloudposse/packages.git"
  version "0.13.7"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform_0.13" do
      system "make", "install"
      bin.install "cloudposse/terraform_0.13"
    end
  end
end
