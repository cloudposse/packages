class Rakkess < Formula
  desc "Review Access - kubectl plugin to show an access matrix for all available resources"
  url "https://github.com/cloudposse/packages.git"
  version "0.5.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/rakkess" do
      system "make", "install"
      bin.install "cloudposse/rakkess"
    end
  end
end
