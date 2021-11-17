class Awsvault < Formula
  desc "A vault for securely storing and accessing AWS credentials in development environments"
  url "https://github.com/cloudposse/packages.git"
  version "6.3.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/aws-vault" do
      system "make", "install"
      bin.install "cloudposse/aws-vault"
    end
  end
end
