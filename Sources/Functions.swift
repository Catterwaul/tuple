
/// A tuple of pairs built out of two underlying tuples.
///
/// - Note: Unlike `zip` for sequences, these two tuples are required to have the same count.
@_documentation(visibility: private) // DocC can't cope with this signature.
@inlinable public func zip<each Element0, each Element1>(
  _ element0: (repeat each Element0),
  _ element1: (repeat each Element1)
) -> (repeat (each Element0, each Element1)) {
  (repeat (each element0, each element1))
}
