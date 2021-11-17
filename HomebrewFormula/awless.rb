class Awless < Formula
  desc "A Mighty CLI for AWS"
  url "https://github.com/cloudposse/packages.git"
  version "0.1.11"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/awless" do
      system "make", "install"
      bin.install "cloudposse/awless"
    end
  end
end
