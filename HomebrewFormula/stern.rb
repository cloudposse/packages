class Stern < Formula
  desc "⎈ Multi pod and container log tailing for Kubernetes"
  url "https://github.com/cloudposse/packages.git"
  version "1.11.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/stern" do
      system "make", "install"
      bin.install "cloudposse/stern"
    end
  end
end
