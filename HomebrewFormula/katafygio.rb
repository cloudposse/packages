class Katafygio < Formula
  desc "K8s continuous backup to git"
  url "https://github.com/cloudposse/packages.git"
  version "0.8.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/katafygio" do
      system "make", "install"
      bin.install "cloudposse/katafygio"
    end
  end
end
