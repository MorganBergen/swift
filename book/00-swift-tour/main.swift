/**
 *  @file        main.swift
 *  @brief       guided tour of swift
 **/

/**
 *    
 *    compilation processes
 *    
 *    interpretation
 *    swift main.swift
 *    
 *    compilation to binary executable
 *    swiftc main.swift
 *    ./main
 *    
 *    compilation with swift package manager
 *    mkdir ProjectName
 *    cd ProjectName
 *    swift package init --name ProjectName --type executable
 *    swift run
 *    swift build -c release
 *    ./build/release/ProjectName
 *    
 *    
 **/





/**
 *    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") 
 *    prints the given items to the standard output.
 *    
 *    parameters
 *    items         zero or more items to print
 *    separator     a string to print between each item.  the default is a single space ( " " )
 *    terminator    string to print after all items have been printed.  the default is a newline ( "\n" )
 *    
 *    writes the textual representations of the given items into the standard output:
 *    you can pass zero or more items to the print(_:separator:terminator:) function.
 *    the textual representation for each item is the same as that obtaining by call 
 *    String(describing: item)
 *
 *    the following example, 
 *    prints a string to standard output
 *    a range of integers to standard output
 *    a group of floating-point values to standard output
 *    
 **/

print("One two three four five")
print(1...5)
print(1.0, 2.0, 3.0, 4.0, 5.0)

//  to print the items separated by something other than a space, pass a string as a separator
print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ")
//  1.0 ... 2.0 ... 3.0 ... 4.0 ... 5.0

//  the output from each call to print (_:separator:terminator:) includes a newline by default
//  to print the items without a trailing newline, pass an empty string as terminator
for n in 1...5 {
    print(n, terminator: "")
}
//  12345


/**********************************************************************************/
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

