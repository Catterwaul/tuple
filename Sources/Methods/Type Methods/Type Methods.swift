/// Repeat a value to match the shape of a tuple.
/// - Parameters:
///   - tupleType: The type that defines how many `values` will be returned.
@inlinable public func `repeat`<each Element, Value>(
  _ value: Value,
  _ tupleType: (repeat each Element).Type = (repeat each Element).self
) -> (repeat Each<Value, each Element>) {
  (repeat { _ in value } ((each Element).self))
}
