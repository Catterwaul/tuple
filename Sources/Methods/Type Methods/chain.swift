/// Concatenate 2 tuples into one.
@inlinable public func chain<
  each Element0,
  each Element1
>(
  _ element0: (repeat each Element0),
  _ element1: (repeat each Element1)
) -> (
  repeat each Element0,
  repeat each Element1
) {
  ( repeat each element0,
    repeat each element1
  )
}

/// Concatenate 3 tuples into one.
@inlinable public func chain<
  each Element0,
  each Element1,
  each Element2
>(
  _ element0: (repeat each Element0),
  _ element1: (repeat each Element1),
  _ element2: (repeat each Element2)
) -> (
  repeat each Element0,
  repeat each Element1,
  repeat each Element2
) {
  ( repeat each element0,
    repeat each element1,
    repeat each element2
  )
}

/// Concatenate 4 tuples into one.
@inlinable public func chain<
  each Element0,
  each Element1,
  each Element2,
  each Element3
>(
  _ element0: (repeat each Element0),
  _ element1: (repeat each Element1),
  _ element2: (repeat each Element2),
  _ element3: (repeat each Element3)
) -> (
  repeat each Element0,
  repeat each Element1,
  repeat each Element2,
  repeat each Element3
) {
  ( repeat each element0,
    repeat each element1,
    repeat each element2,
    repeat each element3
  )
}
