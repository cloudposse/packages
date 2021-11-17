class Grpcurl < Formula
  desc "Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers"
  url "https://github.com/cloudposse/packages.git"
  version "1.8.5"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/grpcurl" do
      system "make", "install"
      bin.install "cloudposse/grpcurl"
    end
  end
end
