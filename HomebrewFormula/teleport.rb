class Teleport < Formula
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://gravitational.com/teleport"
  url "https://github.com/gravitational/teleport/archive/v8.0.0.tar.gz"
  sha256 "63cd8a169723575ee1658aa26622424038079815cf28443f4a3c770e95c1331f"
  license "Apache-2.0"
  head "https://github.com/gravitational/teleport.git", branch: "master"

  # We check the Git tags instead of using the `GithubLatest` strategy, as the
  # "latest" version can be incorrect. As of writing, two major versions of
  # `teleport` are being maintained side by side and the "latest" tag can point
  # to a release from the older major version.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "632281be527a4dc11bb9cdc12407315cd7fa5bde7e3bd0d687c0fda89a41dc13"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "b7ab9865d5797f7529526e0d3b442dcc3d046a92959ff42c70a50b90490fbd8b"
    sha256 cellar: :any_skip_relocation, monterey:       "ae9336e015a5da1c6d07cbb99aa3f22bf9e31ad540ef3ec8b397607b3183c3a7"
    sha256 cellar: :any_skip_relocation, big_sur:        "dde5140de44d98f8cf416074b2b4cb2f28e7cb31a2a397bbef28cbe5aff3324b"
    sha256 cellar: :any_skip_relocation, catalina:       "de1a78b89555887ef733a83ccba25a55b4327bdf5c1ff9917e4f9237edfed152"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "4babcd6497e80f95ee0b133e79ffba0437080df36fdfc060141e4628bff7e6e1"
  end

  depends_on "go" => :build

  uses_from_macos "curl" => :test
  uses_from_macos "netcat" => :test
  uses_from_macos "zip"

  conflicts_with "etsh", because: "both install `tsh` binaries"

  # Keep this in sync with https://github.com/gravitational/teleport/tree/v#{version}
  resource "webassets" do
    url "https://github.com/gravitational/webassets/archive/a1039e35e86aec770db6cdb32321c93356477757.tar.gz"
    sha256 "11010e65d44d8b9bb956ffbaf18249c8cb370d36c47d165f9fc905ea624ce25c"
  end

  def install
    (buildpath/"webassets").install resource("webassets")
    ENV.deparallelize { system "make", "full" }
    bin.install Dir["build/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/teleport version")
    assert_match version.to_s, shell_output("#{bin}/tsh version")
    assert_match version.to_s, shell_output("#{bin}/tctl version")

    mkdir testpath/"data"
    (testpath/"config.yml").write <<~EOS
      version: v2
      teleport:
        nodename: testhost
        data_dir: #{testpath}/data
        log:
          output: stderr
          severity: WARN
    EOS

    fork do
      exec "#{bin}/teleport start --roles=proxy,node,auth --config=#{testpath}/config.yml"
    end

    sleep 10
    system "curl", "--insecure", "https://localhost:3080"

    status = shell_output("#{bin}/tctl --config=#{testpath}/config.yml status")
    assert_match(/Cluster\s*testhost/, status)
    assert_match(/Version\s*#{version}/, status)
  end
end
