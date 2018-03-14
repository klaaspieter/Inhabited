# Inhabited

A collection that cannot be empty

## Installation

### SPM

Add the following to your `Package.swift` dependencies:

```swift
.package(url: https://github.com/klaaspieter/Inhabited, from: "0.0.1")
```

## Usage

```swift
// Non empty Arrays
Inhabited([]) // .none
Inhabited([1, 2, 3, 4] // [1, 2, 3, 4]

// Non empty Strings
Inhabited("") // .none
Inhabited("hello") // "hello"
```
