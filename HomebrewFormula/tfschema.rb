class Tfschema < Formula
  desc "A schema inspector for Terraform providers"
  url "https://github.com/cloudposse/packages.git"
  version "0.7.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/tfschema" do
      system "make", "install"
      bin.install "cloudposse/tfschema"
    end
  end
end
