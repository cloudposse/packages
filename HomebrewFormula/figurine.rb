class Figurine < Formula
  desc "Print your name in style"
  url "https://github.com/cloudposse/packages.git"
  version "1.0.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/figurine" do
      system "make", "install"
      bin.install "cloudposse/figurine"
    end
  end
end
