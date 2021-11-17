class Teleport4.3 < Formula
  desc "Privileged access management for elastic infrastructure."
  url "https://github.com/cloudposse/packages.git"
  version "4.3.10"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/teleport-4.3" do
      system "make", "install"
      bin.install "cloudposse/teleport-4.3"
    end
  end
end
