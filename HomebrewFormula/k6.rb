class K6 < Formula
  desc "A modern load testing tool, using Go and JavaScript - https://k6.io"
  url "https://github.com/cloudposse/packages.git"
  version "0.35.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/k6" do
      system "make", "install"
      bin.install "cloudposse/k6"
    end
  end
end
