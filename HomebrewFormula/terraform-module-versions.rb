class TerraformModuleVersions < Formula
  desc "CLI tool that checks Terraform code for module updates. Single binary, no dependencies. linux, osx, windows."
  url "https://github.com/cloudposse/packages.git"
  version "3.1.7"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform-module-versions" do
      system "make", "install"
      bin.install "cloudposse/terraform-module-versions"
    end
  end
end
