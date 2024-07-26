/// Repeat a value to match the shape of a tuple.
/// - Parameters:
///   - tuple: The tuple that defines how many `values` will be returned.
@inlinable public func `repeat`<each Element, Value>(
  _ tupleType: (repeat each Element).Type = (repeat each Element).self,
  _ value: Value
) -> (repeat Repeat<Value, each Element>) {
  (repeat { _ in value } ((each Element).self))
}
