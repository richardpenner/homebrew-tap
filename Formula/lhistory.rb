class Lhistory < Formula
  desc "Cross-shell command history browser with multi-column TUI"
  homepage "https://github.com/richardpenner/lhistory"
  url "https://github.com/richardpenner/lhistory/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "ea89ecbeb23c6eef0c1a016a4a6ead985d9e1d9f9a2ca806947515bf4cc20c3e"
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
