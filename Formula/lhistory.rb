class Lhistory < Formula
  desc "Cross-shell command history browser with inline TUI"
  homepage "https://github.com/richardpenner/lhistory"
  url "https://github.com/richardpenner/lhistory/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "a3ab6694828b51a483825bd805e4a9296e67f56a86f923c5d3078418ca8d9012"
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
