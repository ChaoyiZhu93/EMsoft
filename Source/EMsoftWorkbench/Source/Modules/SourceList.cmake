# ============================================================================
# Copyright (c) 2009-2015 BlueQuartz Software, LLC
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
# Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# Redistributions in binary form must reproduce the above copyright notice, this
# list of conditions and the following disclaimer in the documentation and/or
# other materials provided with the distribution.
#
# Neither the name of BlueQuartz Software, the US Air Force, nor the names of its
# contributors may be used to endorse or promote products derived from this software
# without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# The code contained herein was partially funded by the followig contracts:
#    United States Air Force Prime Contract FA8650-07-D-5800
#    United States Air Force Prime Contract FA8650-10-D-5210
#    United States Prime Contract Navy N00173-07-C-2068
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

set(SUBDIR_NAME Modules)

set(${SUBDIR_NAME}_DIR "${EMsoftWorkbench_SOURCE_DIR}/Source/${SUBDIR_NAME}")

# --------------------------------------------------------------------
# Any Class that inherits from QObject, either directly or through the heirarchy needs to have its header listed here
set(EMsoftWorkbench_${SUBDIR_NAME}_Moc_HDRS
  ${${SUBDIR_NAME}_DIR}/IModuleUI.h
  ${${SUBDIR_NAME}_DIR}/IWorkbenchModule.h
)

# --------------------------------------------------------------------
# Run Qts automoc program to generate some source files that get compiled
QT5_WRAP_CPP( EMsoftWorkbench_${SUBDIR_NAME}_Generated_MOC_SRCS ${EMsoftWorkbench_${SUBDIR_NAME}_Moc_HDRS})
set_source_files_properties( ${EMsoftWorkbench_${SUBDIR_NAME}_Generated_MOC_SRCS} PROPERTIES GENERATED TRUE)
#set_source_files_properties( ${EMsoftWorkbench_${SUBDIR_NAME}_Generated_MOC_SRCS} PROPERTIES HEADER_FILE_ONLY TRUE)

set(EMsoftWorkbench_${SUBDIR_NAME}_HDRS
  ${${SUBDIR_NAME}_DIR}/IModuleFactory.hpp
  ${${SUBDIR_NAME}_DIR}/ModuleFactory.hpp
  ${${SUBDIR_NAME}_DIR}/ModuleManager.h
)


set(EMsoftWorkbench_${SUBDIR_NAME}_SRCS
  ${${SUBDIR_NAME}_DIR}/IModuleUI.cpp
  ${${SUBDIR_NAME}_DIR}/IWorkbenchModule.cpp
  ${${SUBDIR_NAME}_DIR}/ModuleManager.cpp
)

set(EMsoftWorkbench_${SUBDIR_NAME}_HDRS
  ${EMsoftWorkbench_${SUBDIR_NAME}_HDRS}
  ${EMsoftWorkbench_${SUBDIR_NAME}_Moc_HDRS}  # Add the headers that get Moc'ed here so they show up in solutions/IDEs/Project files
)
cmp_IDE_SOURCE_PROPERTIES( "${SUBDIR_NAME}" "${EMsoftWorkbench_${SUBDIR_NAME}_HDRS};${EMsoftWorkbench_${SUBDIR_NAME}_Moc_HDRS}" "${EMsoftWorkbench_${SUBDIR_NAME}_SRCS}" "${PROJECT_INSTALL_HEADERS}")
cmp_IDE_GENERATED_PROPERTIES( "Generated/Qt_Moc" "" "${EMsoftWorkbench_${SUBDIR_NAME}_Generated_MOC_SRCS}" "0")

set(EMsoftWorkbench_${SUBDIR_NAME}_SRCS
  ${EMsoftWorkbench_${SUBDIR_NAME}_SRCS}
  ${EMsoftWorkbench_${SUBDIR_NAME}_Generated_MOC_SRCS}
)



# --------------------------------------------------------------------
# Include all of our modules
include(${${SUBDIR_NAME}_DIR}/PatternDisplayModule/SourceList.cmake)
include(${${SUBDIR_NAME}_DIR}/PatternFitModule/SourceList.cmake)
include(${${SUBDIR_NAME}_DIR}/CrystalStructureCreationModule/SourceList.cmake)
include(${${SUBDIR_NAME}_DIR}/MonteCarloSimulationModule/SourceList.cmake)
include(${${SUBDIR_NAME}_DIR}/MasterPatternSimulationModule/SourceList.cmake)

# -- Add the binary directory for this subdirectory to the include path which is where the moc files are generated
include_directories( ${EMsoftWorkbench_BINARY_DIR})

