class Gonsul < Formula
  desc "A stand-alone alternative to git2consul "
  url "https://github.com/cloudposse/packages.git"
  version "1.0.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/gonsul" do
      system "make", "install"
      bin.install "cloudposse/gonsul"
    end
  end
end
