class Vendir < Formula
  desc " Easy way to vendor portions of git repos, github releases, helm charts, docker image contents, etc. declaratively."
  url "https://github.com/cloudposse/packages.git"
  version "0.23.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/vendir" do
      system "make", "install"
      bin.install "cloudposse/vendir"
    end
  end
end
