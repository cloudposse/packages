class Pgmetrics < Formula
  desc "Postgres metrics"
  url "https://github.com/cloudposse/packages.git"
  version "1.12.0"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/pgmetrics" do
      system "make", "install"
      bin.install "cloudposse/pgmetrics"
    end
  end
end
