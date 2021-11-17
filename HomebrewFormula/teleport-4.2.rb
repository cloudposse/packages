class Teleport4.2 < Formula
  desc "Privileged access management for elastic infrastructure."
  url "https://github.com/cloudposse/packages.git"
  version "4.2.12"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/teleport-4.2" do
      system "make", "install"
      bin.install "cloudposse/teleport-4.2"
    end
  end
end
