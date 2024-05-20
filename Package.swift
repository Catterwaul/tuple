// swift-tools-version: 5.10

import PackageDescription

let name = "Tuplé"

_ = Package(
  name: name,
  products: [.library(name: name, targets: [name])],
  targets: [
    .target(name: name),
    .testTarget(
      name: name + ".Tests",
      dependencies: [.init(stringLiteral: name)]
    )
  ]
)
