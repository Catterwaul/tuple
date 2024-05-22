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

/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1>(
  _ transforms: (
    (Input) -> Transformed0,
    (Input) -> Transformed1
  )
) -> (Input) -> (Transformed0, Transformed1) {
  { (transforms.0($0), transforms.1($0)) }
}

/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1>(
  _ transforms: (
    (Input) throws -> Transformed0,
    (Input) throws -> Transformed1
  )
) -> (Input) throws -> (Transformed0, Transformed1) {
  { try (transforms.0($0), transforms.1($0)) }
}

// MARK: - 3-tuple

/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1, Transformed2>(
  _ transforms: (
    (Input) -> Transformed0,
    (Input) -> Transformed1,
    (Input) -> Transformed2
  )
) -> (Input) -> (Transformed0, Transformed1, Transformed2) {
  { append(callAsFunction(prefix(transforms))($0), transforms.2($0)) }
}

/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1, Transformed2>(
  _ transforms: (
    (Input) throws -> Transformed0,
    (Input) throws -> Transformed1,
    (Input) throws -> Transformed2
  )
) -> (Input) throws -> (Transformed0, Transformed1, Transformed2) {
  { try append(callAsFunction(prefix(transforms))($0), transforms.2($0)) }
}

// MARK: - 4-tuple

/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1, Transformed2, Transformed3>(
  _ transforms: (
    (Input) -> Transformed0,
    (Input) -> Transformed1,
    (Input) -> Transformed2,
    (Input) -> Transformed3
  )
) -> (Input) -> (Transformed0, Transformed1, Transformed2, Transformed3) {
  { append(callAsFunction(prefix(transforms))($0), transforms.3($0)) }
}

/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, Transformed0, Transformed1, Transformed2, Transformed3>(
  _ transforms: (
    (Input) throws -> Transformed0,
    (Input) throws -> Transformed1,
    (Input) throws -> Transformed2,
    (Input) throws -> Transformed3
  )
) -> (Input) throws -> (Transformed0, Transformed1, Transformed2, Transformed3) {
  { try append(callAsFunction(prefix(transforms))($0), transforms.3($0)) }
}
