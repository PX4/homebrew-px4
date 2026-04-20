class Px4SimGazebo < Formula
  desc "PX4 Gazebo simulation toolkit (deprecated no-op meta-formula)"
  homepage "https://github.com/PX4/PX4-Autopilot"
  url "https://raw.githubusercontent.com/PX4/homebrew-px4/master/README.md"
  version "1.16.1"
  sha256 "67dba75ba1ab3c958b0a059b02828a2b957b55d8916fb041a05d7edcc9b6d41a"

  # This formula is intentionally a no-op as of April 2026.
  #
  # Historical context:
  # px4-sim-gazebo was a meta-formula that pulled the Gazebo simulator
  # and its dependencies in via depends_on, including cross-tap deps
  # like osrf/simulation/gz-harmonic, plus px4-dev for the toolchain.
  #
  # In April 2026 Homebrew 4.5 stopped auto-tapping cross-tap
  # dependencies. px4-dev was also deprecated in the same window (see
  # PR #104), so this formula's dependency graph no longer makes sense.
  #
  # The Gazebo simulation setup path now lives in
  # Tools/setup/macos.sh --sim-tools in PX4-Autopilot, alongside the
  # rest of the simulation toolchain install.
  #
  # This formula is kept as a no-op so that older copies of macos.sh,
  # cached Docker images, and third-party tutorials that still run
  # `brew install px4-sim-gazebo` do not error out.

  deprecate! date: "2026-04-20", because: "Gazebo toolchain is installed via Tools/setup/macos.sh --sim-tools"

  def install
    opoo "px4-sim-gazebo is deprecated and installs nothing."
    opoo "Run ./Tools/setup/macos.sh --sim-tools from PX4-Autopilot to " \
         "install the Gazebo simulation toolchain."
    opoo "If you relied on px4-sim-gazebo to pull in gz-harmonic, " \
         "opencv, gstreamer, or other simulator deps, 'brew autoremove' " \
         "may uninstall them. Reinstall them explicitly if you still " \
         "need them."

    (prefix/"DEPRECATED.md").write <<~DOC
      px4-sim-gazebo is a no-op formula kept for backward compatibility.

      The PX4 Gazebo simulation toolchain is now installed by
      Tools/setup/macos.sh --sim-tools in the PX4-Autopilot repository.

      See: https://github.com/PX4/PX4-Autopilot/blob/main/Tools/setup/macos.sh
    DOC
  end

  def caveats
    <<~EOS
      px4-sim-gazebo is deprecated and does nothing.

      Install the PX4 Gazebo simulation toolchain via
      Tools/setup/macos.sh --sim-tools in the PX4-Autopilot repository:

          ./Tools/setup/macos.sh --sim-tools

      That script taps and installs the required simulator packages
      directly, replacing the work this formula used to do.
    EOS
  end

  test do
    assert_path_exists prefix/"DEPRECATED.md"
  end
end
