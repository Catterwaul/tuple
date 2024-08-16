/// Compare tuples of arbitrary count.
@inlinable public func < <each Element: Comparable>(
  _ element0: (repeat each Element),
  _ element1: (repeat each Element)
) -> Bool {
  for elements in repeat (each element0, each element1) {
    if elements.0 < elements.1 { return true }
    if elements.0 > elements.1 { return false }
  }
  return false // Equality.
}

/// Compare tuples of arbitrary count.
@inlinable public func <= <each Element: Comparable>(
  _ element0: (repeat each Element),
  _ element1: (repeat each Element)
) -> Bool {
  !((repeat each element0) > (repeat each element1))
}

/// Compare tuples of arbitrary count.
@inlinable public func > <each Element: Comparable>(
  _ element0: (repeat each Element),
  _ element1: (repeat each Element)
) -> Bool {
  for elements in repeat (each element0, each element1) {
    if elements.0 > elements.1 { return true }
    if elements.0 < elements.1 { return false }
  }
  return false // Equality.
}

/// Compare tuples of arbitrary count.
@inlinable public func >= <each Element: Comparable>(
  _ element0: (repeat each Element),
  _ element1: (repeat each Element)
) -> Bool {
  !((repeat each element0) < (repeat each element1))
}
