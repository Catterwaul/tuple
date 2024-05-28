@available(
  swift, introduced: 6,
  message: "Check to see if calling this still crashes the compiler."
)
/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, each Transformed>(
  _ transform: (repeat (Input) -> each Transformed)
) -> (Input) -> (repeat each Transformed) {
  { (repeat (each transform)($0)) }
}

@available(
  swift, introduced: 6,
  message: "Check to see if calling this still crashes the compiler."
)
/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, each Transformed>(
  _ transform: (repeat (Input) throws -> each Transformed)
) -> (Input) throws -> (repeat each Transformed) {
  { (repeat try (each transform)($0)) }
}

// MARK: - 2-tuple

/// Call a 2-tuple of functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1>(
  _ transforms: (
    (Input) -> Transformed0,
    (Input) -> Transformed1
  )
) -> (Input) -> (Transformed0, Transformed1) {
  { (transforms.0($0), transforms.1($0)) }
}

/// Call a 2-tuple of functions on one input (at least one of which `throws`).
@inlinable public func callAsFunction<Input, Transformed0, Transformed1>(
  _ transforms: (
    (Input) throws -> Transformed0,
    (Input) throws -> Transformed1
  )
) -> (Input) throws -> (Transformed0, Transformed1) {
  { try (transforms.0($0), transforms.1($0)) }
}

// MARK: - 3-tuple

/// Call a 3-tuple of functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1, Transformed2>(
  _ transforms: (
    (Input) -> Transformed0,
    (Input) -> Transformed1,
    (Input) -> Transformed2
  )
) -> (Input) -> (Transformed0, Transformed1, Transformed2) {
  { let prefix = callAsFunction(prefix(transforms))($0)
    return appending(prefix)(transforms.2($0))
  }
}

/// Call a 3-tuple of functions on one input (at least one of which `throws`).
@inlinable public func callAsFunction<Input, Transformed0, Transformed1, Transformed2>(
  _ transforms: (
    (Input) throws -> Transformed0,
    (Input) throws -> Transformed1,
    (Input) throws -> Transformed2
  )
) -> (Input) throws -> (Transformed0, Transformed1, Transformed2) {
  { let prefix = try callAsFunction(prefix(transforms))($0)
    return try appending(prefix)(transforms.2($0))
  }
}

// MARK: - 4-tuple

/// Call a 4-tuple of functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1, Transformed2, Transformed3>(
  _ transforms: (
    (Input) -> Transformed0,
    (Input) -> Transformed1,
    (Input) -> Transformed2,
    (Input) -> Transformed3
  )
) -> (Input) -> (Transformed0, Transformed1, Transformed2, Transformed3) {
  { let prefix: Tuple3 = callAsFunction(prefix(transforms))($0)
    return appending(prefix)(transforms.3($0))
  }
}

/// Call a 4-tuple of functions on one input (at least one of which `throws`).
@inlinable public func callAsFunction<Input, Transformed0, Transformed1, Transformed2, Transformed3>(
  _ transforms: (
    (Input) throws -> Transformed0,
    (Input) throws -> Transformed1,
    (Input) throws -> Transformed2,
    (Input) throws -> Transformed3
  )
) -> (Input) throws -> (Transformed0, Transformed1, Transformed2, Transformed3) {
  { let prefix: Tuple3 = try callAsFunction(prefix(transforms))($0)
    return try appending(prefix)(transforms.3($0))
  }
}
