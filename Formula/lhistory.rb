class Lhistory < Formula
  desc "Cross-shell command history browser with inline TUI"
  homepage "https://github.com/richardpenner/lhistory"
  url "https://github.com/richardpenner/lhistory/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "449bf1e9c43757847146f00b74ee95a0dae953ddddd38af8d9b4ac99daea8e7f"
  license "MIT"

  def install
    system "make", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def post_uninstall
    rc_files = {
      "zsh" => File.expand_path("~/.zshrc"),
      "bash" => File.expand_path("~/.bashrc"),
      "fish" => File.expand_path("~/.config/fish/config.fish"),
    }
    rc_files.each do |shell, path|
      next unless File.exist?(path)
      lines = File.readlines(path)
      cleaned = lines.reject { |l| l.include?("lhistory") }
      if cleaned.length < lines.length
        File.write(path, cleaned.join)
        opoo "Removed lhistory lines from #{path} — restart your #{shell} shell"
      end
    end
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
