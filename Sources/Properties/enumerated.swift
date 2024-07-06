/// An enumerated version of a tuple.
///
/// A tuple's elements can be accessed "with integers", like `.0` and `.1`,
/// but those are not available as integers in the type system.
/// This provides that capability.
@inlinable public func enumerated<each Element>(
  _ element: (repeat each Element)
) -> (repeat (offset: Int, element: each Element)) {
  var iterator = (0...).makeIterator()
  return (repeat (iterator.next()!, each element))
}
