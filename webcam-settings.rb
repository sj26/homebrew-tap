class WebcamSettings < Formula
  desc "Keep Logitech webcam settings from resetting on macOS"
  homepage "https://github.com/sj26/webcam-settings"
  url "https://github.com/sj26/webcam-settings/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c5371d1f197082e89e9826e7ae23bb58aec524f7aef462e3b1dfdba6ea8bebd1"
  license "MIT"

  depends_on macos: :monterey

  def install
    system "make", "CC=#{ENV.cc}"
    bin.install "webcam-settings"
  end

  service do
    run [opt_bin/"webcam-settings", "--watch"]
    keep_alive true
    process_type :background
  end

  test do
    assert_match "Usage: webcam-settings", shell_output("#{bin}/webcam-settings --help")
  end
end
