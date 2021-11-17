class Chamber < Formula
  desc "CLI for managing secrets"
  url "https://github.com/cloudposse/packages.git"
  version "2.10.6"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/chamber" do
      system "make", "install"
      bin.install "cloudposse/chamber"
    end
  end
end
