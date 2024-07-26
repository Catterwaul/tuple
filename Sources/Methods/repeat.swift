/// Repeat a value to match the shape of a tuple.
/// - Parameters:
///   - tuple: The tuple that defines how many `values` will be returned.
@inlinable public func `repeat`<each Element, Value>(
  _ tuple: (repeat each Element)
) -> (Value) -> (repeat Repeat<Value, each Element>) {
  { value in (repeat { _ in value } ((each Element).self)) }
}
