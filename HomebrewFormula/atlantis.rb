class Atlantis < Formula
  desc "Terraform For Teams"
  url "https://github.com/cloudposse/packages.git"
  version "0.17.5"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/atlantis" do
      system "make", "install"
      bin.install "cloudposse/atlantis"
    end
  end
end
