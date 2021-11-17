class AwsOkta < Formula
  desc "aws-vault like tool for Okta authentication"
  url "https://github.com/cloudposse/packages.git"
  version "1.0.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/aws-okta" do
      system "make", "install"
      bin.install "cloudposse/aws-okta"
    end
  end
end
