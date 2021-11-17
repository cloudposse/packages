class Gojsonnet < Formula
  desc "This an implementation of Jsonnet in pure Go."
  url "https://github.com/cloudposse/packages.git"
  version "0.17.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/go-jsonnet" do
      system "make", "install"
      bin.install "cloudposse/go-jsonnet"
    end
  end
end
