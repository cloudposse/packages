class Pack < Formula
  desc "Create cloud native Buildpacks"
  url "https://github.com/cloudposse/packages.git"
  version "0.22.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/pack" do
      system "make", "install"
      bin.install "cloudposse/pack"
    end
  end
end
