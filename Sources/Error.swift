public enum Error: Swift.Error & Equatable {
  case incorrectElementCount(expected: Int, actual: Int)
}
