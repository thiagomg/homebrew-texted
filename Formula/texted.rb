class Texted < Formula
  desc "Markdown based blogging system where you own your content"
  homepage "https://thiagocafe.com/page/projects/"
  url "https://gitlab.com/thiagomg/texted.git",
      tag:      "1.0.2",
      revision: "18d056db06c0705a81e198529ae41c7af130d18a"
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
