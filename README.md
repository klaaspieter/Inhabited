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
```
