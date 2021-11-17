# PACKAGE_NAME=${1:-atmos}
PACKAGE_FORMATTED=$(echo $PACKAGE_NAME | sed -e 's/-/ /g' -e 's/\b\(.\)/\u\1/g' -e 's/ //g')
# VERSION=$(cat vendor/$PACKAGE_NAME/VERSION)
# PACKAGE_DESCRIPTION=$(cat vendor/$PACKAGE_NAME/DESCRIPTION)

cat << EOT
class $PACKAGE_FORMATTED < Formula
  desc "$PACKAGE_DESCRIPTION"
  url "https://github.com/cloudposse/packages.git"
  version "$PACKAGE_VERSION"

  def install
    ENV["INSTALL_PATH"] = "cloudposse"
    chdir "vendor/$PACKAGE_NAME" do
      system "make", "install"
      bin.install "cloudposse/$PACKAGE_NAME"
    end
  end
end
EOT
