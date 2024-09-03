# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(trust_wallet_core_library VERSION 0.0.1 LANGUAGES C)

add_library(trust_wallet_core SHARED
  "trust_wallet_core.c"
)

set_target_properties(trust_wallet_core PROPERTIES
  PUBLIC_HEADER trust_wallet_core.h
  OUTPUT_NAME "trust_wallet_core"
)

target_compile_definitions(trust_wallet_core PUBLIC DART_SHARED_LIB)
