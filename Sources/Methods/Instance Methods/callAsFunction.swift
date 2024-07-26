/// Call multiple functions on one input.
/// - Bug: This overload should not be necessary, but the compiler crashes
/// when trying to use the other similar one when `Error` would be `Never`,
/// which is the special case represented by this error-less signature.
@_documentation(visibility: private)
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
