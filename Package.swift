// swift-tools-version: 6.0

import PackageDescription

let name = "Tuplé"

_ = Package(
  name: name,
  products: [.library(name: name, targets: [name])],
  dependencies: [
    Dependency.apple(repositoryName: "docc-plugin").package,
    Dependency.catterwaul(name: "Thrappture").package
  ],
  targets: [
    .target(
      name: name,
      dependencies: [
        Dependency.catterwaul(name: "Thrappture").product
      ]
    ),
    .testTarget(
      name: name + ".Tests",
      dependencies: [.init(stringLiteral: name)]
    )
  ]
)

// MARK: - Dependency

struct Dependency {
  let package: Package.Dependency
  let product: Target.Dependency
}

extension Dependency {
  static func apple(repositoryName: String) -> Self {
    .init(
      organization: "apple",
      name: repositoryName.split(separator: "-").map(\.capitalized).joined(),
      repositoryName: "swift-\(repositoryName)"
    )
  }

  static func catterwaul(name: String, repositoryName: String? = nil) -> Self {
    .init(organization: "Catterwaul", name: name, repositoryName: repositoryName ?? name)
  }

  private init(organization: String, name: String, repositoryName: String) {
    self.init(
      package: .package(
        url: "https://github.com/\(organization)/\(repositoryName)",
        branch: "main"
      ),
      product: .product(name: name, package: repositoryName)
    )
  }
}
