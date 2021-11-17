class Variant < Formula
  desc "Wrap up your bash scripts into a modern CLI today. Graduate to a full-blown golang app tomorrow."
  url "https://github.com/cloudposse/packages.git"
  version "0.37.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/variant" do
      system "make", "install"
      bin.install "cloudposse/variant"
    end
  end
end
