class Px4SimJmavsim < Formula
  desc "PX4 jMAVSim simulation (deprecated no-op meta-formula)"
  homepage "https://github.com/PX4/PX4-Autopilot"
  url "https://raw.githubusercontent.com/PX4/homebrew-px4/master/README.md"
  version "1.11.1"
  sha256 "67dba75ba1ab3c958b0a059b02828a2b957b55d8916fb041a05d7edcc9b6d41a"

  # This formula is intentionally a no-op as of April 2026.
  #
  # Historical context:
  # px4-sim-jmavsim was a meta-formula that pulled in ant and px4-dev
  # to provide the jMAVSim Java-based simulator environment.
  #
  # px4-dev was deprecated in the same window (see PR #104), and the
  # simulation toolchain install path now lives in
  # Tools/setup/macos.sh --sim-tools in PX4-Autopilot.
  #
  # This formula is kept as a no-op so that older copies of macos.sh,
  # cached Docker images, and third-party tutorials that still run
  # `brew install px4-sim-jmavsim` do not error out.

  deprecate! date: "2026-04-20", because: "jMAVSim toolchain is installed via Tools/setup/macos.sh --sim-tools"

  def install
    opoo "px4-sim-jmavsim is deprecated and installs nothing."
    opoo "Run ./Tools/setup/macos.sh --sim-tools from PX4-Autopilot to " \
         "install the simulation toolchain."
    opoo "If you relied on px4-sim-jmavsim to pull in ant, " \
         "'brew autoremove' may uninstall it. Reinstall it explicitly " \
         "if you still need it."

    (prefix/"DEPRECATED.md").write <<~DOC
      px4-sim-jmavsim is a no-op formula kept for backward compatibility.

      The PX4 simulation toolchain is now installed by
      Tools/setup/macos.sh --sim-tools in the PX4-Autopilot repository.

      See: https://github.com/PX4/PX4-Autopilot/blob/main/Tools/setup/macos.sh
    DOC
  end

  def caveats
    <<~EOS
      px4-sim-jmavsim is deprecated and does nothing.

      Install the PX4 simulation toolchain via
      Tools/setup/macos.sh --sim-tools in the PX4-Autopilot repository:

          ./Tools/setup/macos.sh --sim-tools

      That script installs the required simulator packages directly,
      replacing the work this formula used to do.
    EOS
  end

  test do
    assert_path_exists prefix/"DEPRECATED.md"
  end
end
