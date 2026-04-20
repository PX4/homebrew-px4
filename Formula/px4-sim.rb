class Px4Sim < Formula
  desc "PX4 simulation toolchain (deprecated no-op meta-formula)"
  homepage "https://github.com/PX4/PX4-Autopilot"
  url "https://raw.githubusercontent.com/PX4/homebrew-px4/master/README.md"
  version "1.11.1"
  sha256 "67dba75ba1ab3c958b0a059b02828a2b957b55d8916fb041a05d7edcc9b6d41a"

  # This formula is intentionally a no-op as of April 2026.
  #
  # Historical context:
  # px4-sim was a meta-formula that pulled in px4-sim-gazebo and
  # px4-sim-jmavsim to install the PX4 simulation toolchain on macOS.
  #
  # The PX4 simulation setup path now lives entirely in
  # Tools/setup/macos.sh in PX4-Autopilot, alongside the rest of the
  # toolchain install. Keeping this formula as a meta-dependency
  # duplicates that logic and drifts out of date whenever the set of
  # supported simulators changes.
  #
  # This formula is kept as a no-op so that older copies of macos.sh,
  # cached Docker images, and third-party tutorials that still run
  # `brew install px4-sim` do not error out. They get a harmless
  # no-op install instead.
  #
  # See PX4/homebrew-px4 PR #104 for the matching px4-dev deprecation.

  def install
    (prefix/"DEPRECATED.md").write <<~DOC
      px4-sim is a no-op formula kept for backward compatibility.

      The PX4 simulation toolchain is now installed by
      Tools/setup/macos.sh --sim-tools in the PX4-Autopilot repository.

      See: https://github.com/PX4/PX4-Autopilot/blob/main/Tools/setup/macos.sh
    DOC
  end

  def caveats
    <<~EOS
      px4-sim is deprecated and does nothing.

      Install the PX4 simulation toolchain via Tools/setup/macos.sh
      in the PX4-Autopilot repository:

          ./Tools/setup/macos.sh --sim-tools

      That script installs the required simulator packages directly,
      replacing the work this formula used to do.
    EOS
  end

  test do
    assert_path_exists prefix/"DEPRECATED.md"
  end
end
