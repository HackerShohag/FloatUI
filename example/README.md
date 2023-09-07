# Example Project with FloatUI
This is an complete example using FloatUI. The CMakeLists.txt contains the standard format of CMake with a subdirectory FloatUI.
    
    add_subdirectory(FloatUI)

This will build the FloatUI library while you need to add the parent directory as this project's subdirectory.

    target_link_libraries(ExampleProject PRIVATE FloatUI)

And there's the common linking that makes the library available to the project.

# Building this projects
Copy the parent directory here as one of it's subdirectory and then configure cmake

    cmake -S . -B build

To make it go to build directory and run

    make
