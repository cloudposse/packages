class Fargate < Formula
  desc "CLI for AWS Fargate"
  url "https://github.com/cloudposse/packages.git"
  version "0.3.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/fargate" do
      system "make", "install"
      bin.install "cloudposse/fargate"
    end
  end
end
