class Cowtree < Formula
  desc "Copy-on-write git worktrees for parallel AI coding sessions"
  homepage "https://github.com/paakofiaidoo/cowtree"
  url "https://github.com/paakofiaidoo/cowtree/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "4a8ea2f38bdb9649f83e4fbde3b9ae59d5cfdcfc37e7c63f1a7d9190b1612b82"
  license "MIT"
  head "https://github.com/paakofiaidoo/cowtree.git", branch: "main"

  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    (bin/"cowtree").write_env_script libexec/"bin/cowtree", PATH: "#{Formula["python@3.12"].opt_bin}:$PATH"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/cowtree version")
  end
end
