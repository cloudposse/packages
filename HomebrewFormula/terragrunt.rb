class Terragrunt < Formula
  desc "Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules."
  url "https://github.com/cloudposse/packages.git"
  version "0.35.10"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terragrunt" do
      system "make", "install"
      bin.install "cloudposse/terragrunt"
    end
  end
end
