class HiDrawbridge < Formula
  desc "Linux hidraw to BatteryWatch D-Bus companion bridge"
  homepage "https://github.com/devopyos/hi-drawbridge"
  version "0.1.0"

  depends_on :linux

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/devopyos/hi-drawbridge/releases/download/v#{version}/hi-drawbridge_#{version}_Linux_x86_64.tar.gz"
      sha256 "482424b14d5d61b10077fc6b2f0394f4079c4eeb4d3d7dae736b5e5e91c8602b"
    elsif Hardware::CPU.arm?
      url "https://github.com/devopyos/hi-drawbridge/releases/download/v#{version}/hi-drawbridge_#{version}_Linux_arm64.tar.gz"
      sha256 "a69b4465d23a48862bb5f3608751663213f798a457f38520b7604af1a1f1b8a7"
    end
  end

  def install
    bin.install "hi-drawbridge"
    (pkgshare/"docs").install "docs/manual-setup.md", "docs/profile-authoring.md"
    (pkgshare/"systemd-user").install Dir["packaging/systemd-user/*"]
    (pkgshare/"udev-rules").install Dir["packaging/udev-rules/*"]
  end

  def caveats
    <<~EOS
      The binary and example setup assets are installed under:
        #{opt_pkgshare}

      hi-drawbridge does not install host integration for you.
      If you want the user service or udev rules, use the shipped examples:
        #{opt_pkgshare}/systemd-user/hi-drawbridge.service
        #{opt_pkgshare}/udev-rules/

      Then follow the manual setup guide:
        #{opt_pkgshare}/docs/manual-setup.md
    EOS
  end

  test do
    assert_match "hi-drawbridge version", shell_output("#{bin}/hi-drawbridge --version")
  end
end
