/// Concatenate 2 tuples into one.
@inlinable public func flattened<
  each Element0,
  each Element1
>(
  _ elements: (
    (repeat each Element0),
    (repeat each Element1)
  )
) -> (
  repeat each Element0,
  repeat each Element1
) {
  ( repeat each elements.0,
    repeat each elements.1
  )
}

/// Concatenate 3 tuples into one.
@inlinable public func flattened<
  each Element0,
  each Element1,
  each Element2
>(
  _ elements: (
    (repeat each Element0),
    (repeat each Element1),
    (repeat each Element2)
  )
) -> (
  repeat each Element0,
  repeat each Element1,
  repeat each Element2
) {
  ( repeat each elements.0,
    repeat each elements.1,
    repeat each elements.2
  )
}

/// Concatenate 4 tuples into one.
@inlinable public func flattened<
  each Element0,
  each Element1,
  each Element2,
  each Element3
>(
  _ elements: (
    (repeat each Element0),
    (repeat each Element1),
    (repeat each Element2),
    (repeat each Element3)
  )
) -> (
  repeat each Element0,
  repeat each Element1,
  repeat each Element2,
  repeat each Element3
) {
  ( repeat each elements.0,
    repeat each elements.1,
    repeat each elements.2,
    repeat each elements.3
  )
}
