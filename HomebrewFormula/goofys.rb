class Goofys < Formula
  desc "a high-performance, POSIX-ish Amazon S3 file system written in Go"
  url "https://github.com/cloudposse/packages.git"
  version "0.24.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/goofys" do
      system "make", "install"
      bin.install "cloudposse/goofys"
    end
  end
end
