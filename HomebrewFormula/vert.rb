class Vert < Formula
  desc "Simple CLI for comparing two or more versions"
  url "https://github.com/cloudposse/packages.git"
  version "0.1.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/vert" do
      system "make", "install"
      bin.install "cloudposse/vert"
    end
  end
end
