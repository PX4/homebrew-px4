class Px4Dev < Formula
  desc "PX4 development toolchain (deprecated no-op meta-formula)"
  homepage "https://github.com/PX4/PX4-Autopilot"
  url "https://raw.githubusercontent.com/PX4/homebrew-px4/master/README.md"
  version "1.16.1"
  sha256 "67dba75ba1ab3c958b0a059b02828a2b957b55d8916fb041a05d7edcc9b6d41a"

  # This formula is intentionally a no-op as of April 2026.
  #
  # Historical context:
  # px4-dev used to be a meta-formula that pulled the full macOS PX4
  # toolchain in via depends_on, including cross-tap deps like
  # osx-cross/arm/arm-gcc-bin@13 and discoteq/discoteq/flock.
  #
  # In April 2026 Homebrew 4.5 stopped auto-tapping cross-tap
  # dependencies (a security and performance change). Any formula
  # whose dependency list names a third-party tap now aborts
  # resolution unless every needed tap has been added beforehand.
  # Homebrew also disallows `brew tap` from inside formula install
  # blocks (audit error), so the formula cannot self-heal.
  #
  # The PX4 toolchain install path now lives entirely in
  # Tools/setup/macos.sh in PX4-Autopilot, which taps osx-cross/arm
  # and PX4/px4 explicitly and then calls brew install on the real
  # packages. This formula is kept as a no-op so that older copies of
  # macos.sh, cached Docker images, and third-party tutorials that
  # still run `brew install px4-dev` don't error out — they just get
  # a harmless no-op.
  #
  # See PX4/PX4-Autopilot PR #27127 for the migration.

  deprecate! date: "2026-04-20", because: "macOS toolchain is installed via Tools/setup/macos.sh in PX4-Autopilot"

  def install
    opoo "px4-dev is deprecated and installs nothing."
    opoo "Run ./Tools/setup/macos.sh from PX4-Autopilot to install the " \
         "PX4 development toolchain."
    opoo "If you relied on px4-dev to pull in arm-gcc-bin@13 or other " \
         "toolchain packages, install them directly or via macos.sh. " \
         "'brew autoremove' may uninstall them otherwise."

    (prefix/"DEPRECATED.md").write <<~DOC
      px4-dev is a no-op formula kept for backward compatibility.

      The PX4 macOS toolchain is now installed by Tools/setup/macos.sh
      in the PX4-Autopilot repository, which taps osx-cross/arm and
      PX4/px4 explicitly and calls brew install on the real packages.

      See: https://github.com/PX4/PX4-Autopilot/blob/main/Tools/setup/macos.sh
    DOC
  end

  def caveats
    <<~EOS
      px4-dev is deprecated and does nothing.

      Install the PX4 toolchain via Tools/setup/macos.sh in the
      PX4-Autopilot repository:

          ./Tools/setup/macos.sh

      That script taps osx-cross/arm and PX4/px4, then installs the
      required packages directly — the work this formula used to do.
    EOS
  end

  test do
    assert_path_exists prefix/"DEPRECATED.md"
  end
end
