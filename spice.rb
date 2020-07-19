class Spice < Formula
  desc ""
  homepage ""
  url "https://www.spice-space.org/download/releases/spice-server/spice-0.14.3.tar.bz2"
  sha256 "551d4be4a07667cf0543f3c895beb6da8a93ef5a9829f2ae47817be5e616a114"
  license ""
  depends_on "pkg-config"
  depends_on "spice-protocol"
  depends_on "glib"
  depends_on "pixman"
  depends_on "lz4"
  depends_on "libjpeg-turbo"
  depends_on "opus-tools"

  patch do
    url "https://github.com/yaroslavros/spice/commit/3c78f3ec8651d758b0802c8c5b06f32069d7bf64.diff?full_index=1"
    sha256 "ed508516ad71a086112d846eda58d8439c17e798dd46d594607badd6e23dae98"
  end

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    # system "cmake", ".", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test spice`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
