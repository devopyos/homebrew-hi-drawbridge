class HiDrawbridge < Formula
  desc "Linux hidraw to BatteryWatch D-Bus companion bridge"
  homepage "https://github.com/devopyos/hi-drawbridge"
  version "0.1.2"

  depends_on :linux

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/devopyos/hi-drawbridge/releases/download/v#{version}/hi-drawbridge_#{version}_Linux_x86_64.tar.gz"
      sha256 "1b998382c889ce119fbe1f87be1354c67aa5a6ee349320d06e3a362cb3b168bb"
    elsif Hardware::CPU.arm?
      url "https://github.com/devopyos/hi-drawbridge/releases/download/v#{version}/hi-drawbridge_#{version}_Linux_arm64.tar.gz"
      sha256 "ae8320835fd7a39ca5198be2ca70aebb29306932c6b25a545ac763a7073fab8f"
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
