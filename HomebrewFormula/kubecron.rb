class Kubecron < Formula
  desc "Utilities to manage kubernetes cronjobs. Run a CronJob manually for test purposes. Suspend/unsuspend a CronJob"
  url "https://github.com/cloudposse/packages.git"
  version "2.0.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/kubecron" do
      system "make", "install"
      bin.install "cloudposse/kubecron"
    end
  end
end
