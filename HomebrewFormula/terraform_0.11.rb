class Terraform_0.11 < Formula
  desc "Terraform (Deprecated package. Use terraform-0.11 instead)"
  url "https://github.com/cloudposse/packages.git"
  version "0.11.15"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform_0.11" do
      system "make", "install"
      bin.install "cloudposse/terraform_0.11"
    end
  end
end
