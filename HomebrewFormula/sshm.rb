class Sshm < Formula
  desc "Easy connect on EC2 instances thanks to AWS System Manager Agent"
  url "https://github.com/cloudposse/packages.git"
  version "1.2.2"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/sshm" do
      system "make", "install"
      bin.install "cloudposse/sshm"
    end
  end
end
