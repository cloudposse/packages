class Json2hcl < Formula
  desc "Convert JSON to HCL, and vice versa"
  url "https://github.com/cloudposse/packages.git"
  version "0.0.6"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/json2hcl" do
      system "make", "install"
      bin.install "cloudposse/json2hcl"
    end
  end
end
