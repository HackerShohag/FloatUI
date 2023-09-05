cmake_minimum_required(VERSION 3.16)

project(FloatUI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})

find_package(Qt6 6.2 COMPONENTS Quick Widgets REQUIRED)


qt_add_library(FloatUI STATIC)
qt_add_qml_module(FloatUI
    URI FloatUI
    VERSION 1.0
    QML_FILES
        templates/FloatWindow.qml
        templates/Buttons/ActionButton.qml
        templates/Buttons/InfoButton.qml
        templates/Buttons/OverlayButton.qml
        templates/utils.js
    SOURCES
        src/floatui.cpp
        src/floatui.h
)

set_target_properties(FloatUI PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(FloatUI
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(FloatUI
    PRIVATE Qt6::Quick)

target_include_directories(FloatUI PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

# Example Project
# qt_add_executable(ExampleProject example/example.cpp)
# qt_add_qml_module(ExampleProject
#     URI ExampleProjectApp
#     VERSION 1.0
#     QML_FILES example/example.qml
# )
# target_link_libraries(ExampleProject PRIVATE Qt6::Quick Qt6::Widgets FloatUIplugin)
# target_compile_definitions(ExampleProject PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
