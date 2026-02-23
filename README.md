# swift

```bash
❯ swift --version
swift-driver version: 1.115.1 Apple Swift version 6.0.3 (swiftlang-6.0.3.1.10 clang-1600.0.30.1)
Target: arm64-apple-macosx15
```

####  swift package manager

swift comes bundled with the swift package manager `SwiftPM`, which is used for managing the distribution of swift code and is integrated with the swift build system to automate the process of downloading, combining, and linking dependencies.

a package manager is a tool that automates how you download, organize, and link reusable libraries, similar to how `#include` brings in headers but across whole projects.  instead of manually finding a library, copying its files, and updating build settings, a package manager lets you declare the libraries you need, figures out compatible versions, downloads them, and integrates them into the compiler/linker steps for you.  this reduces the overhead of managing dependencies and allows you to focus on writing your code.

####  modules

swift organizes code into modules, each modules specifies a namespace and enforces access controls on which parts of the code can be used outside of the module.  a namespace is a collection of related definitions, such as types, functions, and variables.  a program may have all of its code in a single module, or it may import other modules as dependencies.  aside of the handful of system provide modules, such as `Darwin` on macOS, most dependencies require code to be downloaded and built in order to be used.  

when you use a separate module for code that solves a particular problem, that code can be reused in other situations.  for example, a module that provides functionality for making network requests can be shared between one app and another app.  using modules lets you build on top of other developers' code rather than reimplementing the same functionality yourself.

####  packages

a package consists of swift source files and a manifest file.  the manifest file, called `Package.swift`, defines the package's name and its contents using the `PackageDescription` modules.  a package has one or more targets.  each target specifies a product and may declare one or more dependencies.

####  products

a target may build either a library or an executable as its product.  a library contains a module that can be imported by other swift code.  an executable program that can be run by the operating system.

####  dependencies

a target's dependencies are modules that are required by code in the package.  a dependency consists of a relative or absolute url to the source of the package and a set of requirements for the version of the package that can be used.  the role of the package manager is to reduce coordination costs by automating the process of downloading and building all of the dependencies for a project.  this is a recursive process - a dependency can have its own dependencies, each of which can also have dependencies, forming a dependency graph.  the package manager downloads and builds everything that is needed to satisfy the entire dependency graph.



