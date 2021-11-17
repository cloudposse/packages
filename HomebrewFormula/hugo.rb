class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"
  url "https://github.com/gohugoio/hugo/archive/v0.89.3.tar.gz"
  sha256 "14540d78996269e2c655e2a7fe592897b4d741f9c226958b655951af21b1e007"
  license "Apache-2.0"
  head "https://github.com/gohugoio/hugo.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b94706fa2554f39d08d37cf239e0a46668e67aa74e891f64af19d96cbbb2f4c5"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "6ee4f5a69da09574779de0edbe44119a868a8c451bc2b257d3ac7d32aae4ef72"
    sha256 cellar: :any_skip_relocation, monterey:       "a63046716a3a1d40c2240f11ea953c81a507c21e6243568277534a734624eeb7"
    sha256 cellar: :any_skip_relocation, big_sur:        "206cb44d7e3a8361817b4896c2c52cbb9d157b378e359a877f8b28a98e9a88f3"
    sha256 cellar: :any_skip_relocation, catalina:       "0f9a238ef87222adbc41d0b5c15961402aec31749cf032eecc9cd01ce2ec9414"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "4ca11a2b455b3dab90606a16017c07c4505fad169475b3076571ad07b3f8f008"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-tags", "extended"

    # Build bash completion
    system bin/"hugo", "gen", "autocomplete", "--completionfile=hugo.sh"
    bash_completion.install "hugo.sh"

    # Build man pages; target dir man/ is hardcoded :(
    (Pathname.pwd/"man").mkpath
    system bin/"hugo", "gen", "man"
    man1.install Dir["man/*.1"]
  end

  test do
    site = testpath/"hops-yeast-malt-water"
    system "#{bin}/hugo", "new", "site", site
    assert_predicate testpath/"#{site}/config.toml", :exist?
  end
end
