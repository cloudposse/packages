class Jq < Formula
  desc "Command-line JSON processor"
  url "https://github.com/cloudposse/packages.git"
  version "1.6.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/jq" do
      system "make", "install"
      bin.install "cloudposse/jq"
    end
  end
end
