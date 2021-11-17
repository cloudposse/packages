class Packer < Formula
  desc "Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
  url "https://github.com/cloudposse/packages.git"
  version "1.7.8"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/packer" do
      system "make", "install"
      bin.install "cloudposse/packer"
    end
  end
end
