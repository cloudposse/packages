class Lazydocker < Formula
  desc "The lazier way to manage everything docker"
  url "https://github.com/cloudposse/packages.git"
  version "0.12.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/lazydocker" do
      system "make", "install"
      bin.install "cloudposse/lazydocker"
    end
  end
end
