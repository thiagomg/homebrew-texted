class Simplegrep < Formula
  desc "Grep alternative for those lazy to remember many command-line options"
  homepage "https://thiagocafe.com/page/projects/"
  url "https://gitlab.com/thiagomg/sgrep.git",
      tag:      "1.0.4",
      revision: "c47e271de3dd50ca49b865b2e6c9e51ad1c1a9c4"
  license "Apache-2.0"
  head "https://gitlab.com/thiagomg/sgrep.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/sgrep --version")
    assert_match "sgrep 1.0.4", output

    output = shell_output("echo 'XYZ' | #{bin}/sgrep -p 'X' --raw")
    assert_match "XYZ", output
  end
end
