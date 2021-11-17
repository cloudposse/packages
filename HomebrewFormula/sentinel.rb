class Sentinel < Formula
  desc "Hashicorp sentinel"
  url "https://github.com/cloudposse/packages.git"
  version "0.14.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/sentinel" do
      system "make", "install"
      bin.install "cloudposse/sentinel"
    end
  end
end
