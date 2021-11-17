class Tfenv < Formula
  desc "Transform environment variables for use with Terraform (e.g. `HOSTNAME` ⇨ `TF_VAR_hostname`)"
  url "https://github.com/cloudposse/packages.git"
  version "0.4.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/tfenv" do
      system "make", "install"
      bin.install "cloudposse/tfenv"
    end
  end
end
