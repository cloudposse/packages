class Kubectl < Formula
  desc "Production-Grade Container Scheduling and Management"
  url "https://github.com/cloudposse/packages.git"
  version "1.22.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubectl" do
      system "make", "install"
      bin.install "cloudposse/kubectl"
    end
  end
end
