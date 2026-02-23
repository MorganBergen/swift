/**
 *  @file    main.swift
 *  @author  apple
 *  @brief   guidedtour.md
 * 
 **/

/*

##  compilation

intrepret and run the code

`swift main.swift`

compile to binary executable 

`swiftc main.swift`
`./main`

3.  using the swift package manager

```
swift package init --type executable
nvim Sources/main.swift
swift run
swift build -c release
.build/release/<projectname>
```

*/

/**
 *    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") 
 *    prints the given items to the standard output.
 *    
 *    writes the textual representations of the given items into the standard output:
 *
 **/
print("hello")

let myconstant = 42
var myvariable = 20
myvariable = 30

print(myconstant)



let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

let explicitFloat: Float = 70

print(explicitFloat)

let label = "the width is "
let width = 94
let widthLabel = label + String(width)

