message(STATUS "3rd party loc - ${sweetPy_3RD_PARTY_DIR}")
find_path(CORE_INCLUDE_DIR NAMES core/Exception.h PATHS ${sweetPy_3RD_PARTY_DIR}/include)
find_program(CORE_LIBRARY_DIR NAMES libCore${CMAKE_DEBUG_POSTFIX}.so PATHS ${sweetPy_3RD_PARTY_DIR}/lib)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Core REQUIRED_VARS CORE_INCLUDE_DIR CORE_LIBRARY_DIR)

if(Core_FOUND)
    message(STATUS "Found Core include dir - ${Green}${CORE_INCLUDE_DIR}${ColourReset}")
    message(STATUS "Found Core library dir - ${Green}${CORE_LIBRARY_DIR}${ColourReset}")
else()
    message(WARNING "${Red}Core not found${ColourReset}")
endif()
