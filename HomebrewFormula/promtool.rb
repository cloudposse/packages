class Promtool < Formula
  desc "Prometheus CLI tool"
  url "https://github.com/cloudposse/packages.git"
  version "2.31.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/promtool" do
      system "make", "install"
      bin.install "cloudposse/promtool"
    end
  end
end
