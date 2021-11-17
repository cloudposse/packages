class Opa < Formula
  desc "An open source project to policy-enable your service."
  url "https://github.com/cloudposse/packages.git"
  version "0.34.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/opa" do
      system "make", "install"
      bin.install "cloudposse/opa"
    end
  end
end
