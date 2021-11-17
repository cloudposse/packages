class Trivy < Formula
  desc "A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI"
  url "https://github.com/cloudposse/packages.git"
  version "0.21.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/trivy" do
      system "make", "install"
      bin.install "cloudposse/trivy"
    end
  end
end
