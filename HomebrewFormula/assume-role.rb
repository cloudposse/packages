class Assumerole < Formula
  desc "Easily assume AWS roles in your terminal."
  url "https://github.com/cloudposse/packages.git"
  version "0.3.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/assume-role" do
      system "make", "install"
      bin.install "cloudposse/assume-role"
    end
  end
end
