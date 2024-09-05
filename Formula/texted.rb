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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test texted`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
