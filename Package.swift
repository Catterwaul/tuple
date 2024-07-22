// swift-tools-version: 6.0

import Foundation // for String.capitalized
import PackageDescription

let name = "Tuplé"

_ = Package(
  name: name,
  products: [.library(name: name, targets: [name])],
  dependencies: dependencies.map(\.package),
  targets: [
    .target(
      name: name,
      dependencies: dependencies.dropFirst().map(\.product)
    ),
    .testTarget(
      name: name + ".Tests",
      dependencies: [.init(stringLiteral: name)]
    )
  ]
)

// MARK: - Dependency

nonisolated var dependencies: [Dependency]  {
  [ .swift(repositoryName: "docc-plugin"),
    .catterwaul(name: "Thrappture")
  ]
}

struct Dependency {
  let package: Package.Dependency
  let product: Target.Dependency
}

extension Dependency {
  static func apple(repositoryName: String) -> Self {
    .swift(organization: "apple", repositoryName: repositoryName)
  }

  static func swift(organization: String = "swiftlang", repositoryName: String) -> Self {
    .init(
      organization: organization,
      name: repositoryName.split(separator: "-").map(\.capitalized).joined(),
      repositoryName: "swift-\(repositoryName)"
    )
  }

  static func catterwaul(name: String, repositoryName: String? = nil, branch: String? = nil) -> Self {
    .init(
      organization: "Catterwaul",
      name: name,
      repositoryName: repositoryName ?? name,
      branch: branch
    )
  }

  private init(organization: String, name: String, repositoryName: String, branch: String? = nil) {
    self.init(
      package: .package(
        url: "https://github.com/\(organization)/\(repositoryName)",
        branch: branch ?? "main"
      ),
      product: .product(name: name, package: repositoryName)
    )
  }
}
