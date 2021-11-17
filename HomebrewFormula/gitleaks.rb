class Gitleaks < Formula
  desc "Audit git repos for secrets 🔑"
  url "https://github.com/cloudposse/packages.git"
  version "7.6.1"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/gitleaks" do
      system "make", "install"
      bin.install "cloudposse/gitleaks"
    end
  end
end
