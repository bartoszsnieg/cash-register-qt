cmake_minimum_required(VERSION 3.16)

project(kasafiskalna VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Gui Qml Quick OPTIONAL_COMPONENTS Multimedia VirtualKeyboard)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Gui Qml Quick OPTIONAL_COMPONENTS Multimedia VirtualKeyboard)

set(PROJECT_SOURCES
        main.cpp
        qml.qrc
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS LinguistTools)
find_package(Qt6 REQUIRED COMPONENTS Core)

    qt_add_executable(kasafiskalna
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}

        ui/commponents/common/keyboard/virtualkeyboardcontroller.h ui/commponents/common/keyboard/virtualkeyboardcontroller.cpp

        ui/commponents/Forms/formcontroller.cpp ui/commponents/Forms/formcontroller.h
        ui/pagecontroller.h ui/pagecontroller.cpp
    )

qt_add_translations(kasafiskalna TS_FILES kasafiskalna_en_US.ts)
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET kasafiskalna APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
else()
    if(ANDROID)
        add_library(kasafiskalna SHARED
            ${PROJECT_SOURCES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(kasafiskalna
          ${PROJECT_SOURCES}
        )
    endif()
endif()

target_link_libraries(kasafiskalna
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick Qt${QT_VERSION_MAJOR}::Gui Qt${QT_VERSION_MAJOR}::Qml)
target_link_libraries(kasafiskalna PRIVATE Qt6::Core)
target_link_libraries(kasafiskalna PRIVATE Qt6::Core)
target_link_libraries(kasafiskalna PRIVATE Qt6::Core)
target_link_libraries(kasafiskalna PRIVATE Qt6::Core)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
if(${QT_VERSION} VERSION_LESS 6.1.0)
  set(BUNDLE_ID_OPTION MACOSX_BUNDLE_GUI_IDENTIFIER com.example.kasafiskalna)
endif()
set_target_properties(kasafiskalna PROPERTIES
    ${BUNDLE_ID_OPTION}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include(GNUInstallDirs)
install(TARGETS kasafiskalna
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(kasafiskalna)
    qt_finalize_executable(kasafiskalna)
endif()
