class Terraformconfiginspect < Formula
  desc "A helper library for shallow inspection of Terraform configurations"
  url "https://github.com/cloudposse/packages.git"
  version "0.0.20211115214459+git90acf1ca460f"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform-config-inspect" do
      system "make", "install"
      bin.install "cloudposse/terraform-config-inspect"
    end
  end
end
