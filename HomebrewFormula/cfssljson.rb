class Cfssljson < Formula
  desc "Cloudflare's PKI and TLS toolkit json parser"
  url "https://github.com/cloudposse/packages.git"
  version "1.6.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/cfssljson" do
      system "make", "install"
      bin.install "cloudposse/cfssljson"
    end
  end
end
