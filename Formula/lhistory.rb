class Lhistory < Formula
  desc "Cross-shell command history browser with inline TUI"
  homepage "https://github.com/richardpenner/lhistory"
  url "https://github.com/richardpenner/lhistory/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "22105f4787326f641414b8df54018b073558776fd31d4230a16474419850a573"
  license "MIT"

  def install
    system "make", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      To set up shell integration, run:
        lhistory install

      To uninstall cleanly, run this BEFORE `brew uninstall`:
        lhistory uninstall
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/lhistory --help 2>&1", 0)
  end
end
