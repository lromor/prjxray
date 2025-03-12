load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")

cc_library(
    name = "prjxray",
    srcs = [
        "lib/database.cc",
        "lib/memory_mapped_file.cc",
        "lib/segbits_file_reader.cc",
        "lib/xilinx/bitstream_writer.cc",
        "lib/xilinx/configuration_packet.cc",
        "lib/xilinx/configuration_register.cc",
        "lib/xilinx/configuration.cc",
        "lib/xilinx/frames.cc",

        # Spartan6 specific
        "lib/xilinx/spartan6/frame_address.cc",
        "lib/xilinx/spartan6/global_clock_region.cc",
        "lib/xilinx/spartan6/part.cc",
        "lib/xilinx/spartan6/configuration_row.cc",
        "lib/xilinx/spartan6/block_type.cc",
        "lib/xilinx/spartan6/configuration_bus.cc",
        "lib/xilinx/spartan6/configuration_column.cc",

        # Series-7 specific
        "lib/xilinx/xc7series/frame_address.cc",
        "lib/xilinx/xc7series/global_clock_region.cc",
        "lib/xilinx/xc7series/part.cc",
        "lib/xilinx/xc7series/configuration_row.cc",
        "lib/xilinx/xc7series/block_type.cc",
        "lib/xilinx/xc7series/configuration_bus.cc",
        "lib/xilinx/xc7series/configuration_column.cc",
        "lib/xilinx/xc7series/ecc.cc",
    ],
    hdrs = glob(["lib/include/**/*.h"]),
    includes = ["lib/include"],
    deps = [
        "@abseil-cpp//absl/types:optional",
        "@abseil-cpp//absl/types:variant",
        "@abseil-cpp//absl/strings:strings",
        "@abseil-cpp//absl/types:span",
        "@abseil-cpp//absl/time:time",
        "@yaml-cpp//:yaml-cpp",
    ],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "test_data",
    srcs = glob(["lib/test_data/**"]),
    visibility = ["//visibility:public"],
)

cc_test(
    name = "big_endian_span_test",
    srcs = ["lib/big_endian_span_test.cc"],
    deps = [
        ":prjxray",
        "@googletest//:gtest_main",
    ],
)

cc_test(
    name = "bit_ops_test",
    srcs = ["lib/bit_ops_test.cc"],
    deps = [
        ":prjxray",
        "@googletest//:gtest_main",
    ],
)

cc_test(
    name = "memory_mapped_file_test",
    srcs = ["lib/memory_mapped_file_test.cc"],
    deps = [
        ":prjxray",
        "@googletest//:gtest_main",
    ],
    data = ["//:test_data"],
)

cc_test(
    name = "segbits_file_reader_test",
    srcs = ["lib/segbits_file_reader_test.cc"],
    deps = [
        ":prjxray",
        "@googletest//:gtest_main",
    ],
    data = ["//:test_data"],
)

cc_test(
    name = "xilinx_xc7series_test",
    srcs = [
        "lib/xilinx/tests/xc7series/bitstream_reader_test.cc",
        "lib/xilinx/tests/xc7series/bitstream_writer_test.cc",
        "lib/xilinx/tests/xc7series/block_type_test.cc",
        "lib/xilinx/tests/xc7series/configuration_bus_test.cc",
        "lib/xilinx/tests/xc7series/configuration_column_test.cc",
        "lib/xilinx/tests/xc7series/configuration_packet_test.cc",
        "lib/xilinx/tests/xc7series/configuration_test.cc",
        "lib/xilinx/tests/xc7series/crc_test.cc",
        "lib/xilinx/tests/xc7series/ecc_test.cc",
        "lib/xilinx/tests/xc7series/frame_address_test.cc",
        "lib/xilinx/tests/xc7series/frames_test.cc",
        "lib/xilinx/tests/xc7series/global_clock_region_test.cc",
        "lib/xilinx/tests/xc7series/part_test.cc",
        "lib/xilinx/tests/xc7series/row_test.cc",
    ],
    deps = [
        ":prjxray",
        "@googletest//:gtest_main",
    ],
    data = ["//:test_data"],
)

cc_test(
    name = "xilinx_spartan6_test",
    srcs = [
        "lib/xilinx/tests/spartan6/bitstream_reader_test.cc",
        "lib/xilinx/tests/spartan6/bitstream_writer_test.cc",
        "lib/xilinx/tests/spartan6/block_type_test.cc",
        "lib/xilinx/tests/spartan6/configuration_bus_test.cc",
        "lib/xilinx/tests/spartan6/configuration_column_test.cc",
        "lib/xilinx/tests/spartan6/configuration_packet_test.cc",
        "lib/xilinx/tests/spartan6/configuration_test.cc",
        "lib/xilinx/tests/spartan6/frame_address_test.cc",
        "lib/xilinx/tests/spartan6/frames_test.cc",
        "lib/xilinx/tests/spartan6/global_clock_region_test.cc",
        "lib/xilinx/tests/spartan6/part_test.cc",
        "lib/xilinx/tests/spartan6/row_test.cc",
    ],
    deps = [
        ":prjxray",
        "@googletest//:gtest_main",
    ],
    data = ["//:test_data"],
)
