class Pluto < Formula
  desc "A cli tool to help discover deprecated apiVersions in Kubernetes"
  url "https://github.com/cloudposse/packages.git"
  version "5.1.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/pluto" do
      system "make", "install"
      bin.install "cloudposse/pluto"
    end
  end
end
