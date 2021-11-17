class Teleport4.4 < Formula
  desc "Privileged access management for elastic infrastructure."
  url "https://github.com/cloudposse/packages.git"
  version "4.4.11"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/teleport-4.4" do
      system "make", "install"
      bin.install "cloudposse/teleport-4.4"
    end
  end
end
