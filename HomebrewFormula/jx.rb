class Jx < Formula
  desc "Jenkins-X"
  url "https://github.com/cloudposse/packages.git"
  version "3.2.217"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/jx" do
      system "make", "install"
      bin.install "cloudposse/jx"
    end
  end
end
