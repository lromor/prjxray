{ pkgs ? import <nixpkgs> {} }:
let
  bazel = pkgs.bazel_7;
  clangTools = pkgs.clang-tools_18;
in
pkgs.mkShell {
  name = "prjxray";
  packages = with pkgs; [
    git
    bazel
    jdk
    bash
    bant
    gdb

    # For clang-tidy and clang-format.
    clangTools

    # For buildifier, buildozer.
    bazel-buildtools

    # Profiling and sanitizers.
    linuxPackages_latest.perf
    pprof
    perf_data_converter
    valgrind
  ];

  # Expose as env variables the path to clang tools.
  CLANG_TIDY = "${clangTools}/bin/clang-tidy";
  CLANG_FORMAT = "${clangTools}/bin/clang-format";

  # Override .bazelversion. We only care to have bazel 7.
  USE_BAZEL_VERSION = "${bazel.version}";
}
