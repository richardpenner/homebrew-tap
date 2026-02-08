class Lhistory < Formula
  desc "Cross-shell command history browser with multi-column TUI"
  homepage "https://github.com/richardpenner/lhistory"
  url "https://github.com/richardpenner/lhistory/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "513522db9e6cf94e60156e8d55b4bfa7aa4e75a94482c2ada07daddb469abc22"
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
