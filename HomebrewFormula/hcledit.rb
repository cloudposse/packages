class Hcledit < Formula
  desc "A command line editor for HCL"
  url "https://github.com/cloudposse/packages.git"
  version "0.2.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/hcledit" do
      system "make", "install"
      bin.install "cloudposse/hcledit"
    end
  end
end
