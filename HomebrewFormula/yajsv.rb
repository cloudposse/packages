class Yajsv < Formula
  desc "Yet Another JSON Schema Validator [CLI]"
  url "https://github.com/cloudposse/packages.git"
  version "1.4.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/yajsv" do
      system "make", "install"
      bin.install "cloudposse/yajsv"
    end
  end
end
