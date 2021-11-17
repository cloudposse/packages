class Hugo < Formula
  desc "The world’s fastest framework for building websites."
  url "https://github.com/cloudposse/packages.git"
  version "0.89.4"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/hugo" do
      system "make", "install"
      bin.install "cloudposse/hugo"
    end
  end
end
