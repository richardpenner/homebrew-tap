class Lhistory < Formula
  desc "Cross-shell command history browser with multi-column TUI"
  homepage "https://github.com/richardpenner/lhistory"
  url "https://github.com/richardpenner/lhistory/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "7e575f83cb0fe9fa4bb410ec4ea50223b26702f5903ebbdfc44dd5bca680dd5d"
  license "MIT"

  def install
    system "make", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      Add lhistory to your shell by adding one of these to your rc file:

        # zsh (~/.zshrc)
        eval "$(lhistory init zsh)"

        # bash (~/.bashrc)
        eval "$(lhistory init bash)"

        # fish (~/.config/fish/config.fish)
        eval (lhistory init fish)

      Or run `lhistory install` to do this automatically.
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/lhistory --help 2>&1", 0)
  end
end
