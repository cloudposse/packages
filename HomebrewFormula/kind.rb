class Kind < Formula
  desc "A tool for running local Kubernetes clusters using Docker"
  url "https://github.com/cloudposse/packages.git"
  version "0.11.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kind" do
      system "make", "install"
      bin.install "cloudposse/kind"
    end
  end
end
