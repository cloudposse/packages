class Terraformdocs < Formula
  desc "Generate docs from terraform modules"
  url "https://github.com/cloudposse/packages.git"
  version "0.16.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/terraform-docs" do
      system "make", "install"
      bin.install "cloudposse/terraform-docs"
    end
  end
end
