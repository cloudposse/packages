class Codefresh < Formula
  desc "Codefresh CLI"
  url "https://github.com/cloudposse/packages.git"
  version "0.78.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/codefresh" do
      system "make", "install"
      bin.install "cloudposse/codefresh"
    end
  end
end
