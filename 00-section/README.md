# swiftui

####  content

[introduction](#introduction)

[`swift package init --name main --type executable`](#swift-package-init---name-main---type-executable)

[`swift build`](#swift-build)

[`swift run`](#swift-run)

[`swift --help`](#swift---help)

[`swift --version`](#swift---version)

[swift package manager](#swift-package-manager)

[modules](#modules)

[packages](#packages)

[products](#products)

[dependencies](#dependencies)

###  introduction

swift is a high-level, general purpose, multi-paradigm programming language, that supports object oriented programming, functional programming, and protocol-oriented programming.  swift is a compiled language, which means that the code you write is converted into machine code that can be executed by the computer's processor.  swift is designed to be fast, safe, and expressive.

####  `swift package init --name main --type executable`

initialize a new swift package

```swift
public init(
    name: String,
    platforms: [SupportedPlatform] = [],
    products: [Product] = [],
    dependencies: [Package.Dependency] = [],
    targets: [Target] = [],
    swiftLanguageVersions: [SwiftVersion]? = nil
)
```


```bash
~/00-section

$  mkdir main
$  cd main
$  swift package init --name main --type executable
Creating executable package: main
Creating Package.swift
Creating .gitignore
Creating Sources/
Creating Sources/main.swift

~/00-section/main

❯ tree -a    
.
├── .gitignore
├── Package.swift
└── Sources
    └── main.swift

2 directories, 3 files

❯ cat .gitignore        
.DS_Store
/.build
/Packages
xcuserdata/
DerivedData/
.swiftpm/configuration/registries.json
.swiftpm/xcode/package.xcworkspace/contents.xcworkspacedata
.netrc
```

####  `Package.swift`

```swift
//  swift-tools-version: 6.0
//  The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "main",
    targets: [
        //  Targets are the basic building blocks of a package, defining a module or a test suite.
        //  Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "main"),
    ]
)
```


1.  comments
2.  import declaration
3.  identifier
4.  simple identifier
5.  property declaration
6.  value binding pattern
7.  name: pattern
8.  bound identifier: simple identifier
9.  value: call expression
10. simple identifier
11. call suffix
12. value arguments
13. value argument
14. name: value argument label



comments

`//  swift-tools-version: 6.0`

`//  The swift-tools-version declares the minimum version of Swift required to build this package.`

`//  Targets are the basic building blocks of a package, defining a module or a test suite.`

`//  Targets can depend on other targets in this package and products from dependencies.`

import declaration

####  `main.swift`

```swift
//  The Swift Programming Language
//  https://docs.swift.org/swift-book

print("Hello, world!")
```

####  `swift build`

```bash
~/00-section/main

$  swift build
Building for debugging...
[8/8] Applying main
Build complete! (0.80s)
```

####  `swift run`

```bash
~/00-section/main

$  swift run
Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build of product 'main' complete! (0.13s)
Hello, world!
```

<details><summary><code>$  swift --help</code></summary>
<br>

```bash
OVERVIEW: Swift compiler

USAGE: swift

OPTIONS:
//  long list of options you view in the terminal

Welcome to Swift!

Subcommands:

  swift build      Build Swift packages
  swift package    Create and work on packages
  swift run        Run a program from a package
  swift test       Run package tests
  swift repl       Experiment with Swift code interactively

  Use `swift --version` for Swift version information.

  Use `swift --help` for descriptions of available options and flags.

  Use `swift help <subcommand>` for more information about a subcommand.
```
</details>

<details><summary><code>$  swift --version</code></summary>
<br>

```bash
swift-driver version: 1.115.1 Apple Swift version 6.0.3 (swiftlang-6.0.3.1.10 clang-1600.0.30.1)
Target: arm64-apple-macosx15
```
</details>


<details><summary>swift package manager </summary>
<br>

swift comes bundled with the swift package manager `SwiftPM`, which is used for managing the distribution of swift code and is integrated with the swift build system to automate the process of downloading, combining, and linking dependencies.

</details>

<details><summary>modules</summary>
<br>

swift organizes code into modules, each modules specifies a namespace and enforces access controls on which parts of the code can be used outside of the module.  a namespace is a collection of related definitions, such as types, functions, and variables.  a program may have all of its code in a single module, or it may import other modules as dependencies.  aside of the handful of system provide modules, such as `Darwin` on macOS, most dependencies require code to be downloaded and built in order to be used.  

when you use a separate module for code that solves a particular problem, that code can be reused in other situations.  for example, a module that provides functionality for making network requests can be shared between one app and another app.  using modules lets you build on top of other developers' code rather than reimplementing the same functionality yourself.

</details>

<details><summary>packages</summary>
<br>

a package consists of swift source files and a manifest file.  the manifest file, called `Package.swift`, defines the package's name and its contents using the `PackageDescription` modules.  a package has one or more targets.  each target specifies a product and may declare one or more dependencies.

unofficial package index for swift is [swift package index](https://swiftpackageindex.com)

</details>

<details><summary>products</summary>
<br>

a target may build either a library or an executable as its product.  a library contains a module that can be imported by other swift code.  an executable program that can be run by the operating system.

</details>

<details><summary>dependencies</summary>
<br>

a target's dependencies are modules that are required by code in the package.  a dependency consists of a relative or absolute url to the source of the package and a set of requirements for the version of the package that can be used.  the role of the package manager is to reduce coordination costs by automating the process of downloading and building all of the dependencies for a project.  this is a recursive process - a dependency can have its own dependencies, each of which can also have dependencies, forming a dependency graph.  the package manager downloads and builds everything that is needed to satisfy the entire dependency graph.

</details>



```bash

~/Documents/03-GitHub/swiftui/00-section/test main*                                                                                                                           05:21:48 PM
❯ l
total 0
drwxr-xr-x  2 owner  staff    64B Dec 16 17:21 .
drwxr-xr-x  5 owner  staff   160B Dec 16 17:21 ..

~/Documents/03-GitHub/swiftui/00-section/test main*                                                                                                                           05:21:48 PM
❯ mkdir main

~/Documents/03-GitHub/swiftui/00-section/test main*                                                                                                                           05:22:01 PM
❯ cd main 

~/Documents/03-GitHub/swiftui/00-section/test/main main*                                                                                                                      05:22:03 PM
❯ swift package init --name main --type executable
Creating executable package: main
Creating Package.swift
Creating .gitignore
Creating Sources/
Creating Sources/main.swift

~/Documents/03-GitHub/swiftui/00-section/test/main main*                                                                                                                      05:22:17 PM
❯ ls -l
total 8
-rw-r--r--  1 owner  staff  464 Dec 16 17:22 Package.swift
drwxr-xr-x  3 owner  staff   96 Dec 16 17:22 Sources

~/Documents/03-GitHub/swiftui/00-section/test/main main*                                                                                                                      05:22:24 PM
❯ tree
.
├── Package.swift
└── Sources
    └── main.swift

2 directories, 2 files

```
