// swift-tools-version: 5.10

import PackageDescription

let name = "Tuplé"

_ = Package(
  name: name,
  products: [.library(name: name, targets: [name])],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", branch: "main")
  ],
  targets: [
    .target(name: name),
    .testTarget(
      name: name + ".Tests",
      dependencies: [.init(stringLiteral: name)]
    )
  ]
)
