class Cowtree < Formula
  desc "Copy-on-write git worktrees for parallel AI coding sessions"
  homepage "https://github.com/paakofiaidoo/cowtree"
  url "https://github.com/paakofiaidoo/cowtree/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "572a1f806d2f7ea1f39d6775c87f46b4e9ed22cd001104d95f7643c04a4fdafe"
  license "MIT"
  head "https://github.com/paakofiaidoo/cowtree.git", branch: "main"

  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    (bin/"cowtree").write_env_script libexec/"bin/cowtree", PATH: "#{Formula["python@3.12"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cowtree version")
  end
end
