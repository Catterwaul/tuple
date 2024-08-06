/// Repeat a value to match the shape of a tuple.
/// - Parameters:
///   - tuple: The tuple that defines how many `values` will be returned.
@inlinable public func `repeat`<each Element, Value>(
  _ value: Value,
  _ tupleType: (repeat each Element).Type = (repeat each Element).self
) -> (repeat Repeat<Value, each Element>) {
  (repeat { _ in value } ((each Element).self))
}
