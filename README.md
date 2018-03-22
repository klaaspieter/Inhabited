# Inhabited

A collection that cannot be empty

## Installation

### SPM

Add the following to your `Package.swift` dependencies:

```swift
.package(url: https://github.com/klaaspieter/Inhabited, .branch("master"))
```

## Usage

```swift
// Non empty Arrays
Inhabited([]) // .none
Inhabited([1, 2, 3, 4] // Inhabited(1, 2, 3, 4])?

// Non empty Strings
Inhabited("") // .none
Inhabited("hello") // Inhabited("hello")?

// Filter
Inhabited("hello")?.filter({ _ in false }) // .none
Inhabited("hello")?.filter({ $0 == "l" }) // Inhabited("ll")
let array: [Int] = Inhabited("hello")?.filter({ _ in false }) // []
```

### Partial RangeReplaceableCollection conformance

`RangeReplaceableCollection` requires `replacingSubrange(:with:)` and an empty `init`. Implementing it would force us to crash when the last elements is removed. Instead only the mutating addition methods are implemented. The removal methods are all non-mutating and return a new `Inhabited` or `.none` if the collection becomes empty.

```swift
// insertions
var collection = Inhabited("h")
collection?.append("i") // Inhabited("hi")

var collection = Inhabited("lo")
collection?.insert(contentsOf: "hel", at: 0) // Inhabited("hello")

// removals
let collection = Inhabited("hhello")?.removing(at: 0) // Inhabited("hello")
let collection = Inhabited("h")?.removing(at: 0) // .none
Inhabited("hello")?.replacingSubrange(0...4, with: "")) // .none
```
