class Terraform1 < Formula
  desc "Terraform enables you to safely and predictably create, change, and improve infrastructure."
  url "https://github.com/cloudposse/packages.git"
  version "1.0.11"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform-1" do
      system "make", "install"
      bin.install "cloudposse/terraform-1"
    end
  end
end
