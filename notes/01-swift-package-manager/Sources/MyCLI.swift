// The Swift Programming Language
// https://docs.swift.org/swift-book

import Figlet
import ArgumentParser

@main
struct MyCLI: ParsableCommand {
    @Option(help: "Specify the input")
    public var input: String

    public func run() throws {
        Figlet.say(self.input)
    }
}

