# FloatUI
This is a Rich UI design library using QtQuick2 (QML) with Qt6 Dependency. This has simple itegration with QML which will be easy to use for anyone to make an application out of it.

# Example
    An example App using this library `Neural Network Trainer` which trains and see the performance of some predefined Neural Network with some sample data.

![image](https://github.com/HackerShohag/FloatUI/assets/47150885/ad617526-057f-4adf-ab56-96cdbdd5ecae)(https://github.com/HackerShohag/SimpleNeuralNetwork)

# To use it with your application

## Changes in CMakeLists.txt file
Add the git module as a subdirecoty to build it:

    add_subdirectory(path/to/this/project)
Link the library to your project:

    target_link_libraries(ExampleProject PRIVATE FloatUIplugin)

## Use it in main.qml file

    import QtQuick
    import FloatUI
    
    FloatWindow {
        windowHeader: Item {
            anchors.fill: parent
            Text {
                id: windowTitle
                text: qsTr("Set your App title")
                anchors.centerIn: parent
                font.pixelSize: 20
                color: "black"
            }
        }
    
        mainContentItem: Item {
            anchors.fill: parent
        }
    
        menuItem: Item {
            anchors.fill: parent
            OverlayButton {
                id:btn1
                title: "Smart Scan"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
                radius: itemRadius / 2
                selected: true
                selectColor: selectedColor
                callBackFunction: setRandomGradientValue
            }
        }
    }

Note that some of the properties are predefined, so use it cautiously. A detailed example can be found in the example dir.

# Compiling the example project
Uncomment the lines from `# Example Project` to the last line in `CMakeLists.txt` to compile this project as an standalone application.

    qt_add_executable(ExampleProject example/example.cpp)
    qt_add_qml_module(ExampleProject
        URI ExampleProjectApp
        VERSION 1.0
        QML_FILES example/example.qml
    )
    target_link_libraries(ExampleProject PRIVATE Qt6::Quick Qt6::Widgets FloatUIplugin)
    target_compile_definitions(ExampleProject PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
