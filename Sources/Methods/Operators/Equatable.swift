/// Equate tuples of arbitrary count.
@inlinable public func == <each Element: Equatable>(
  _ element0: (repeat each Element),
  _ element1: (repeat each Element)
) -> Bool {
  for elements in repeat (each element0, each element1) {
    guard elements.0 == elements.1 else { return false }
  }
  return true
}

/// Equate tuples of arbitrary count.
@inlinable public func != <each Element: Equatable>(
  _ element0: (repeat each Element),
  _ element1: (repeat each Element)
) -> Bool {
  !((repeat each element0) == (repeat each element1))
}

/// Equate tuples of tuples.
///
/// Tuples can't be considered `Equatable`,
/// so just using a version of `==` that compares parameters packs of `Equatables` is not adequate.
@_documentation(visibility: private) // DocC can't cope with this signature.
@inlinable public func == <each Element0: Equatable, each Element1: Equatable>(
  _ element0: (repeat (each Element0, each Element1)),
  _ element1: (repeat (each Element0, each Element1))
) -> Bool {
  for elements in repeat (each element0, each element1) {
    guard elements.0 == elements.1 else { return false }
  }
  return true
}

/// Equate tuples of tuples.
///
/// Tuples can't be considered `Equatable`,
/// so just using a version of `==` that compares parameters packs of `Equatables` is not adequate.
@_documentation(visibility: private) // DocC can't cope with this signature.
@inlinable public func != <each Element0: Equatable, each Element1: Equatable>(
  _ element0: (repeat (each Element0, each Element1)),
  _ element1: (repeat (each Element0, each Element1))
) -> Bool {
  !((repeat each element0) == (repeat each element1))
}
