/// The number of elements in a tuple.
@inlinable public func count<each Element>(
  _ element: (repeat each Element)
) -> Int {
  count((repeat each Element).self)
}

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

/// Whether a tuple contains any elements.
///
/// - Note: The tuple that represents one `Void` is a special case.
/// Even though `()` is a value, it is considered to be "empty", or "zero-element".
/// *(And it doesn't matter how many parentheses you might nest it in; it's still the same.)*
@inlinable public func isEmpty<each Element>(
  _ tuple: (repeat each Element)
) -> Bool {
  isEmpty((repeat each Element).self)
}
