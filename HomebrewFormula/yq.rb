class Yq < Formula
  desc "yq is a portable command-line YAML processor"
  url "https://github.com/cloudposse/packages.git"
  version "4.14.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/yq" do
      system "make", "install"
      bin.install "cloudposse/yq"
    end
  end
end
