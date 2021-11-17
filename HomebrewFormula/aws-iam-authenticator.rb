class Awsiamauthenticator < Formula
  desc "A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
  url "https://github.com/cloudposse/packages.git"
  version "0.5.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/aws-iam-authenticator" do
      system "make", "install"
      bin.install "cloudposse/aws-iam-authenticator"
    end
  end
end
