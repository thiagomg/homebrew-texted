class Texted < Formula
  desc "Markdown based blogging system where you own your content"
  homepage "https://thiagocafe.com/page/projects/"
  url "https://gitlab.com/thiagomg/texted.git",
      tag:      "1.1.1",
      revision: "661f542fa1392b65b818924dbd31a9c0112333cd"
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
