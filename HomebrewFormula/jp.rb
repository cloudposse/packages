class Jp < Formula
  desc "Command line interface to JMESPath"
  url "https://github.com/cloudposse/packages.git"
  version "0.2.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/jp" do
      system "make", "install"
      bin.install "cloudposse/jp"
    end
  end
end
