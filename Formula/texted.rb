class Texted < Formula
  desc "Markdown based blogging system where you own your content"
  homepage "https://thiagocafe.com/page/projects/"
  url "https://gitlab.com/thiagomg/texted.git",
      tag:      "1.0.0",
      revision: "90fb49e36946fbdf3352e60f2190b4d5eaeece89"
  license "Apache-2.0"
  head "https://gitlab.com/thiagomg/texted.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    version_output = shell_output("#{bin}/texted --version").chomp
    assert_equal "texted #{version}", version_output

    version_output = shell_output("#{bin}/texted-tool --version").chomp
    assert_equal "texted #{version}", version_output
  end
end
