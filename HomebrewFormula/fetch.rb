class Fetch < Formula
  desc "fetch makes it easy to download files, folders, and release assets from a specific public git commit, branch, or tag"
  url "https://github.com/cloudposse/packages.git"
  version "0.4.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/fetch" do
      system "make", "install"
      bin.install "cloudposse/fetch"
    end
  end
end
