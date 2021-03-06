find_path(GOOGLE_TEST_INCLUDE_DIR NAMES gtest/gtest.h PATHS ${sweetPy_3RD_PARTY_DIR}/include)
find_library(GOOGLE_TEST_LIBRARY_DIR NAMES libgtest.so libgtest_main.so PATHS ${sweetPy_3RD_PARTY_DIR}/lib)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GOOGLE_TEST REQUIRED_VARS GOOGLE_TEST_INCLUDE_DIR GOOGLE_TEST_LIBRARY_DIR)

if(GOOGLE_TEST_FOUND)
    message(STATUS "Found Google Test include dir - ${Green}${GOOGLE_TEST_INCLUDE_DIR}${ColourReset}")
    message(STATUS "Found Google Test library dir - ${Green}${GOOGLE_TEST_LIBRARY_DIR}${ColourReset}")
else()
    message(WARNING "${Red}Google Test not found${ColourReset}")
endif()
