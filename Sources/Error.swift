/// An enumeration of all the errors defined by this package.
public enum Error: Swift.Error & Equatable {
  case incorrectElementCount(expected: Int, actual: Int)
}
