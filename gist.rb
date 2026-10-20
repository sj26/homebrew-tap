class Gist < Formula
  desc "Command-line utility for uploading Gists"
  homepage "https://github.com/defunkt/gist"
  head "https://github.com/sj26/gist.git", branch: "auth-token-from-git-credential-helper"

  def install
    system "rake", "install", "prefix=#{prefix}"
  end

  test do
    assert_match %r{https:\/\/gist}, pipe_output("#{bin}/gist", "homebrew")
  end
end
