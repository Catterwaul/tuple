/// Adds an element to the end of a tuple.
@inlinable public func appending<each Element, Last>(
  _ prefix: (repeat each Element)
) -> (_ last: Last) -> (repeat each Element, Last) {
  { last in (repeat each prefix, last) }
}

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

/// Call a closure on each element of a tuple.
/// - Parameters:
///   - input: A tuple of inputs.
/// - Bug: "Instance method syntax" is not currently supported by the compiler, if an error is involved.
/// Use the stopgap ``forEach(_:_:)`` overload for those cases.
@inlinable public func forEach<each Input>(
  _ input: (repeat each Input)
) -> ((repeat (each Input) -> Void)) -> Void {
  { body in repeat (each body)(each input) }
}

/// Call a closure on each element of a tuple.
/// - Parameters:
///   - input: A tuple of inputs.
///   - body: One closure for each input element.
@inlinable public func forEach<each Input, Error>(
  _ input: (repeat each Input),
  _ body: (repeat (each Input) throws(Error) -> Void)
) throws(Error) {
  repeat try (each body)(each input)
}

/// Transform each element of a tuple.
/// - Parameters:
///   - input: A tuple of inputs.
///   - transform: One closure for each input element.
/// - Bug: ["Instance method syntax" is not currently supported by the compiler.](https://github.com/swiftlang/swift/issues/75563)
/// - Bug: [`transform` being a tuple is not currently supported by the compiler.](https://github.com/swiftlang/swift/issues/75558)
@_documentation(visibility: private) // DocC can't cope with this signature.
@inlinable public func map<each Input, each Output, Error>(
  _ input: (repeat each Input),
  transforms transform: repeat (each Input) throws(Error) -> each Output
) throws(Error) -> (repeat each Output) {
  (repeat try (each transform)(each input))
}

/// Repeat a value to match the shape of a tuple.
/// - Parameters:
///   - tuple: The tuple that defines how many `values` will be returned.
@inlinable public func `repeat`<each Element, Value>(
  _ tuple: (repeat each Element)
) -> (Value) -> (repeat Repeat<Value, each Element>) {
  { `repeat`((repeat each Element).self, $0) }
}
