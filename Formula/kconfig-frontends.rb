class KconfigFrontends < Formula
  desc "Kernel configuration frontends and parser"
  homepage "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
  url "http://px4-travis.s3.amazonaws.com/toolchain/kconfig-frontends-3.7.0.0.tar.gz"
  sha256 "a0d9b6565cf671337d0d570da872cc3847ce0c8355f7208807121d0c2fdddea9"

  bottle do
    # cellar :any
    root_url "http://px4-travis.s3.amazonaws.com/toolchain/bottles"
    sha256 mavericks:   "9c02a28ea1c55253299560fbac6b7772425cc194f30fae5e055c6c9a664e1a08"
    sha256 yosemite:    "9c02a28ea1c55253299560fbac6b7772425cc194f30fae5e055c6c9a664e1a08"
    sha256 el_capitan:  "9c02a28ea1c55253299560fbac6b7772425cc194f30fae5e055c6c9a664e1a08"
    sha256 sierra:      "9c02a28ea1c55253299560fbac6b7772425cc194f30fae5e055c6c9a664e1a08"
    sha256 high_sierra: "9c02a28ea1c55253299560fbac6b7772425cc194f30fae5e055c6c9a664e1a08"
    sha256 mojave:      "9c02a28ea1c55253299560fbac6b7772425cc194f30fae5e055c6c9a664e1a08"
  end

  depends_on "autoconf" => :build

  depends_on "automake" => :build

  depends_on "libtool" => :build

  depends_on "pkg-config" => :build

  depends_on "xz" => :build

  patch :DATA

  def install
    system "./bootstrap"

    args = %W[
      --prefix=#{prefix}
      --disable-debug
      --disable-dependency-tracking
    ]
    args << "--disable-nconf" if Hardware::CPU.arm?

    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/kconfig-conf"
  end
end

__END__
diff -ru ../orig/kconfig-frontends-3.7.0.0/bootstrap ./bootstrap
--- ../orig/kconfig-frontends-3.7.0.0/bootstrap	2012-04-04 10:04:39.000000000 -0700
+++ ./bootstrap	2013-01-29 22:32:58.000000000 -0800
@@ -2,7 +2,7 @@
 set -e

 printf "Running libtoolize...\n"
-libtoolize --copy --force
+glibtoolize --copy --force

 printf "Running aclocal...\n"
 aclocal -Wall --force
diff -ru ../orig/kconfig-frontends-3.7.0.0/configure.ac ./configure.ac
--- ../orig/kconfig-frontends-3.7.0.0/configure.ac	2012-11-18 03:49:49.000000000 -0800
+++ ./configure.ac	2013-01-29 22:36:07.000000000 -0800
@@ -88,7 +88,7 @@
                [# Escape the $ signs, otherwise they would get munged by make
                 # Also, append a space at the end, to separate the package
                 # name from the literal 'Configuration'
-                root_menu="$( echo "$enableval" |sed -r -e 's/\$/\\$$/g;' )"])])
+                root_menu="$( echo "$enableval" |sed -E -e 's/\$/\\$$/g;' )"])])
 AC_SUBST([root_menu], [${root_menu=Configuration}])

 AC_ARG_ENABLE(
diff -ru ../orig/kconfig-frontends-3.7.0.0/scripts/ksync.sh ./scripts/ksync.sh
--- ../orig/kconfig-frontends-3.7.0.0/scripts/ksync.sh	2012-05-29 15:38:07.000000000 -0700
+++ ./scripts/ksync.sh	2013-01-29 22:37:17.000000000 -0800
@@ -20,7 +20,7 @@

 # Get the kernel version
 eval $( head -n 5 "${k_dir}/Makefile"                       \
-        |sed -r -e 's/^/K_/; s/"//g; s/ = ?/="/; s/$/"/;'   \
+        |sed -E -e 's/^/K_/; s/"//g; s/ = ?/="/; s/$/"/;'   \
       )
 k_cset="$( cd "${k_dir}";                   \
            git log -n 1 --pretty='format:%H' \
@@ -58,4 +58,4 @@
     "${k_cset_old}..${k_cset}"                  \
     ${k_files}                                  \
 )|tee -a "scripts/ksync.log"                    \
- |sed -r -e 's/^/    /;'
+ |sed -E -e 's/^/    /;'
diff -ru ../orig/kconfig-frontends-3.7.0.0/scripts/version.sh ./scripts/version.sh
--- ../orig/kconfig-frontends-3.7.0.0/scripts/version.sh	2012-11-15 13:19:08.000000000 -0800
+++ ./scripts/version.sh	2013-01-29 22:36:35.000000000 -0800
@@ -26,7 +26,7 @@
 fi

 k_ver_plain="$( printf "%s" "${k_ver}"  \
-                |sed -r -e 's/-rc.*//;' )"
+                |sed -E -e 's/-rc.*//;' )"

 case "${kf_ver}" in
     hg) kf_ver="hg_$( hg id -i -r . )"
diff -ru ../orig/kconfig-frontends-3.7.0.0/utils/Makefile.am ./utils/Makefile.am
--- ../orig/kconfig-frontends-3.7.0.0/utils/Makefile.am	2012-06-07 15:41:29.000000000 -0700
+++ ./utils/Makefile.am	2013-01-29 22:41:34.000000000 -0800
@@ -16,6 +16,6 @@
 EXTRA_DIST = tweak.in tweak.in.patch

 tweak: tweak.in
-	$(AM_V_GEN)$(SED) -r -e "s/@CONFIG_@/$(config_prefix)/g"    \
+	$(AM_V_GEN)$(SED) -E -e "s/@CONFIG_@/$(config_prefix)/g"    \
 	                  $< >$@
 	@chmod +x $@
diff -ru ../orig/kconfig-frontends-3.7.0.0/utils/tweak.in ./utils/tweak.in
--- ../orig/kconfig-frontends-3.7.0.0/utils/tweak.in	2012-12-15 07:18:58.000000000 -0800
+++ ./utils/tweak.in	2013-01-29 22:36:58.000000000 -0800
@@ -66,9 +66,9 @@
 	name_re="^($name=|# $name is not set)"
 	before_re="^($before=|# $before is not set)"
 	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
-		sed -ri "/$before_re/a $new" "$FN"
+		sed -Ei "/$before_re/a $new" "$FN"
 	elif grep -Eq "$name_re" "$FN"; then
-		sed -ri "s:$name_re.*:$new:" "$FN"
+		sed -Ei "s:$name_re.*:$new:" "$FN"
 	else
 		echo "$new" >>"$FN"
 	fi
@@ -77,7 +77,7 @@
 undef_var() {
 	local name=$1

-	sed -ri "/^($name=|# $name is not set)/d" "$FN"
+	sed -Ei "/^($name=|# $name is not set)/d" "$FN"
 }

 if [ "$1" = "--file" ]; then
