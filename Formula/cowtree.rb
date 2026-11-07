class Cowtree < Formula
  desc "Copy-on-write git worktrees for parallel AI coding sessions"
  homepage "https://github.com/paakofiaidoo/cowtree"
  url "https://github.com/paakofiaidoo/cowtree/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "8bd833ab65dd0ff917491b1e40fbb7d00c74b5e0cec4a74d1553804f15c83348"
  license "MIT"
  head "https://github.com/paakofiaidoo/cowtree.git", branch: "main"

  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    (bin/"cowtree").write_env_script libexec/"bin/cowtree", PATH: "#{Formula["python@3.12"].opt_bin}:$PATH"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/cowtree version")
  end
end
