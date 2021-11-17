class Tflint < Formula
  desc "A Pluggable Terraform Linter"
  url "https://github.com/cloudposse/packages.git"
  version "0.33.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/tflint" do
      system "make", "install"
      bin.install "cloudposse/tflint"
    end
  end
end
