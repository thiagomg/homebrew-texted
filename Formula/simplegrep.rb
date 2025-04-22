class Simplegrep < Formula
  desc "Grep alternative for those lazy to remember many command-line options"
  homepage "https://thiagocafe.com/page/projects/"
  url "https://gitlab.com/thiagomg/sgrep.git",
      tag:      "1.0.7",
      revision: "a7b5ead590d8371e4f9ab9801be1158fd8c92c33"
  license "Apache-2.0"
  head "https://gitlab.com/thiagomg/sgrep.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/sgrep --version")
    assert_match "sgrep 1.0.7", output

    output = shell_output("echo 'XYZ' | #{bin}/sgrep -p 'X' --raw")
    assert_match "XYZ", output
  end
end
