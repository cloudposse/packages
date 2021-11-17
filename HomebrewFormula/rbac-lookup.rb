class Rbaclookup < Formula
  desc "Find Kubernetes roles and cluster roles bound to any user, service account, or group name."
  url "https://github.com/cloudposse/packages.git"
  version "0.7.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/rbac-lookup" do
      system "make", "install"
      bin.install "cloudposse/rbac-lookup"
    end
  end
end
