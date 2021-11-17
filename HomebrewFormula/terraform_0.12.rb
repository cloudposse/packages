class Terraform_0.12 < Formula
  desc "Terraform (Deprecated package. Use terraform-0.12 instead)"
  url "https://github.com/cloudposse/packages.git"
  version "0.12.31"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform_0.12" do
      system "make", "install"
      bin.install "cloudposse/terraform_0.12"
    end
  end
end
