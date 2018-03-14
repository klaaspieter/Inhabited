// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "Inhabited",
  products: [
    .library(
      name: "Inhabited",
      targets: ["Inhabited"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Inhabited",
      dependencies: []),
    .testTarget(
      name: "InhabitedTests",
      dependencies: ["Inhabited"]),
  ]
)
