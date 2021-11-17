class Ec2InstanceSelector < Formula
  desc "A CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory"
  url "https://github.com/cloudposse/packages.git"
  version "2.0.3"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/ec2-instance-selector" do
      system "make", "install"
      bin.install "cloudposse/ec2-instance-selector"
    end
  end
end
