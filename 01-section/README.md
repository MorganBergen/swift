# swiftui

####  contents

1.  swift package manager
2.  modules
3.  packages
4.  products
5.  dependencies
6.  bootstrapping
7.  a small application
8.  argument passing

```bash
❯ swift --version
swift-driver version: 1.115.1 Apple Swift version 6.0.3 (swiftlang-6.0.3.1.10 clang-1600.0.30.1)
Target: arm64-apple-macosx15
```

####  swift package manager

swift comes bundled with the swift package manager `SwiftPM`, which is used for managing the distribution of swift code and is integrated with the swift build system to automate the process of downloading, combining, and linking dependencies.

####  modules

swift organizes code into modules, each modules specifies a namespace and enforces access controls on which parts of the code can be used outside of the module.  a namespace is a collection of related definitions, such as types, functions, and variables.  a program may have all of its code in a single module, or it may import other modules as dependencies.  aside of the handful of system provide modules, such as `Darwin` on macOS, most dependencies require code to be downloaded and built in order to be used.  

when you use a separate module for code that solves a particular problem, that code can be reused in other situations.  for example, a module that provides functionality for making network requests can be shared between one app and another app.  using modules lets you build on top of other developers' code rather than reimplementing the same functionality yourself.

####  packages

a package consists of swift source files and a manifest file.  the manifest file, called `Package.swift`, defines the package's name and its contents using the `PackageDescription` modules.  a package has one or more targets.  each target specifies a product and may declare one or more dependencies.

unofficial package index for swift is [swift package index](https://swiftpackageindex.com)

####  products

a target may build either a library or an executable as its product.  a library contains a module that can be imported by other swift code.  an executable program that can be run by the operating system.

####  dependencies

a target's dependencies are modules that are required by code in the package.  a dependency consists of a relative or absolute url to the source of the package and a set of requirements for the version of the package that can be used.  the role of the package manager is to reduce coordination costs by automating the process of downloading and building all of the dependencies for a project.  this is a recursive process - a dependency can have its own dependencies, each of which can also have dependencies, forming a dependency graph.  the package manager downloads and builds everything that is needed to satisfy the entire dependency graph.

###  bootstrapping

let's build a small application with the swift development environment.  to start, we'll use the `SwiftPM` to make a new project for us.  

```bash
$  mkdir MyCLI
$  cd MyCLI
$  swift package init --name MyCLU --type executable
```

this will generate a new directory called `MyCLI` with the following structure:

```bash
~/Documents/03-GitHub/swiftui/00-section main*  
$ swift package init --name MyCLI --type executable
Creating executable package: MyCLI
Creating Package.swift
Creating .gitignore
Creating Sources/
Creating Sources/main.swift

~/Documents/03-GitHub/swiftui/00-section main*  
$  tree
.
├── README.md
├── Package.swift
└── Sources
    └── main.swift

2 directories, 3 files

~/Documents/03-GitHub/swiftui/00-section main*
$ ls -la
total 24
drwxr-xr-x   7 owner  staff   224B Dec 16 15:51 .
drwxr-xr-x@  8 owner  staff   256B Dec 16 15:51 ..
drwxr-xr-x  10 owner  staff   320B Dec 16 15:51 .build
-rw-r--r--@  1 owner  staff   159B Dec 16 15:41 .gitignore
-rw-r--r--@  1 owner  staff   466B Dec 16 15:41 Package.swift
-rw-r--r--@  1 owner  staff   3.8K Dec 16 15:51 README.md
drwxr-xr-x@  3 owner  staff    96B Dec 16 15:41 Sources
```

`Package.swift` is the manifest file for swift, it essentially is a file that defines the configuration and metadata for your swift package manager.  it is always called `Package.swift`, it's written in swift, and is located at the root of your project.  `Package.swift` defines the package name, version, and target platforms.

`Sources/main.swift` is the application entry point, where the application logic is written.

`swift run` is the command used to run the application

```bash
~/Documents/03-GitHub/swiftui/00-section main*

$  swift run MyCLI
Building for debugging...
[8/8] Applying MyCLI
Build of product 'MyCLI' complete! (0.77s)
Hello, world!
```

###  adding dependencies

swift based applications are usually composed from libraries that provide useful functionality, we will use a package called [`example-package-figlet`](https://github.com/apple/example-package-figlet), which is used to build a command line tool that displays text in ascii art. 

`Package.swift` init

```swift
//  swift-tools-version: 6.0
//  The swift-tool-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyCLI",
    targets: [
        //  Targets are the basic building blocks of a package, defining a module or a test suite.
        //  Targets can depend on other target sin this package and products from dependencies.
        .executableTarget(
            name: "MyCLI"),
    ]
)
```

we will update our `Package.swift` to add the `example-package-figlet` dependency.

####  `Package.swift`

```swift
//  swift-tools-version: 6.0
//  The swift-tool-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyCLI",
    dependencies: [
        .package(url: "https://github.com/apple/example-package-figlet", branch: "main"),
    ],
    targets: [
        //  Targets are the basic building blocks of a package, defining a module or a test suite.
        //  Targets can depend on other target sin this package and products from dependencies.
        .executableTarget(
            name: "MyCLI",
            dependencies: [
                .product(name: "Figlet", package: "example-package-figlet"),
            ],
            path: "Sources"),
    ]
)
```

running `swift build` will instruct `SwiftPM` to download the new dependencies and then proceed to build the code.  running this command also creates a new file for us called, `Package.resolved`.  this file is a snapshot of the exact version of the dependencies we are using locally.

```bash
~/Documents/03-GitHub/swiftui/00-section main*

$  swift build

Fetching https://github.com/apple/example-package-figlet
Fetched https://github.com/apple/example-package-figlet from cache (0.66s)
Creating working copy for https://github.com/apple/example-package-figlet
Working copy of https://github.com/apple/example-package-figlet resolved at main (166eef4)
Building for debugging...
[14/14] Applying MyCLI
Build complete! (9.62s)
```


###  a small application

we will start by removing `main.swift` and replace it with a new file called `MyCLI.swift`, and add the following code to it.

####  `main.swift`

```swift
//  The Swift Programming Language
//  https://docs.swift.org/swift-book

print("Hello, world!")
```

####  `MyCLI.swift`

```swift
import Figlet

@main
struct FigletTool {
    static func main() {
        Figlet.say("Hello, world!")
    }
}
```

this provides a new entry point to the app which could be asynchronous if required.  you can either have a `main.swift` file or a `@main` entrypoint, but not both.  with `import Figlet` we can now use the `Figlet` module that the `example-package-figlet` package exports.  once we save that, we can run our application with `swift run`.

```bash
~/Documents/03-GitHub/swiftui/00-section main*

$  swift run
Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build of product 'MyCLI' complete! (0.13s)
  _   _          _   _                                  _    __   _     _
 | | | |   ___  | | | |   ___          ___  __      __ (_)  / _| | |_  | |
 | |_| |  / _ \ | | | |  / _ \        / __| \ \ /\ / / | | | |_  | __| | |
 |  _  | |  __/ | | | | | (_) |  _    \__ \  \ V  V /  | | |  _| | |_  |_|
 |_| |_|  \___| |_| |_|  \___/  ( )   |___/   \_/\_/   |_| |_|    \__| (_)
                                |/
```

###  argument passing

most command line tools need to be able to parse command line arguments, in order to add this capability to our application, we add a dependency on [`swift-argument-parser`](https://github.com/apple/swift-argument-parser).

####  `Package.swift`

```swift
// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyCLI",
    dependencies: [
        .package(url: "https://github.com/apple/example-package-figlet", branch: "main"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),   
    ],
    targets: [
        //  Targets are the basic building blocks of a package, defining a module or a test suite.
        //  Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "MyCLI",
            dependencies: [
                .product(name: "Figlet", package: "example-package-figlet"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            path: "Sources"),
    ]
)
```

and we import the argument parsing module provided by `swift-argument-parser` and we use it in the application 

####  `MyCLI.swift`

```swift
import Figlet
import ArgumentParser

@main
struct FigletTool: ParsableCommand {
    @Option(help: "Specify the input")
    public var input: String

    public func run() throws {
        Figlet.say(self.input)
    }
}
```

once we have saved that we can run our application with `swift run MyCLI --input 'Hello, world!'`

```bash
~/Documents/03-GitHub/swiftui/00-section main*

$ swift build
Building for debugging...
[2/2] Write swift-version--58304C5D6DBC2206.txt
Build complete! (1.50s)


~/Documents/03-GitHub/swiftui/00-section main*

$ swift run MyCLI --input 'morgan bergen'
Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build of product 'MyCLI' complete! (0.13s)
                                                       _
  _ __ ___     ___    _ __    __ _    __ _   _ __     | |__     ___   _ __    __ _    ___   _ __
 | '_ ` _ \   / _ \  | '__|  / _` |  / _` | | '_ \    | '_ \   / _ \ | '__|  / _` |  / _ \ | '_ \
 | | | | | | | (_) | | |    | (_| | | (_| | | | | |   | |_) | |  __/ | |    | (_| | |  __/ | | | |
 |_| |_| |_|  \___/  |_|     \__, |  \__,_| |_| |_|   |_.__/   \___| |_|     \__, |  \___| |_| |_|
                             |___/                                           |___/
```
