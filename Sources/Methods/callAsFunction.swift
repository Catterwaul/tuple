/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, each Transformed>(
  _ transform: (repeat (Input) -> each Transformed)
) -> (Input) -> (repeat each Transformed) {
  { (repeat (each transform)($0)) }
}

/// Call multiple functions on one input.
@inlinable public func callAsFunction<Input, each Transformed, Error>(
  _ transform: (repeat (Input) throws(Error) -> each Transformed)
) -> (Input) throws(Error) -> (repeat each Transformed) {
  { (repeat try (each transform)($0)) }
}
