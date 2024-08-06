/// The number of elements in a tuple type.
@inlinable public func count<each Element>(
  _ element: (repeat each Element).Type
) -> Int {
  var count = 0
  (repeat { _ in count += 1 } ((each Element).self))
  return count
}

/// Whether a tuple type contains any elements.
///
/// - Note: The tuple that represents one `Void` is a special case.
/// Even though `()` is a value, it is considered to be "empty", or "zero-element".
/// *(And it doesn't matter how many parentheses you might nest it in; it's still the same.)*
@inlinable public func isEmpty<each Element>(
  _ tuple: (repeat each Element).Type
) -> Bool {
  for _ in repeat (each Element).self {
    return false // This *is* tested, but Code Coverage can't detect it. 🙂‍↔️
  }
  return true
}
