class Conftest < Formula
  desc "Test your configuration files using Open Policy Agent"
  url "https://github.com/cloudposse/packages.git"
  version "0.28.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/conftest" do
      system "make", "install"
      bin.install "cloudposse/conftest"
    end
  end
end
