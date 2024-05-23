/// Create a "sorted tuple".
public func sort<Comparable: Swift.Comparable>(
  _ comparable0: Comparable, _ comparable1: Comparable
) -> (Comparable, Comparable) {
  comparable0 <= comparable1
  ? (comparable0, comparable1)
  : (comparable1, comparable0)
}

/// Sort a 2- tuple".
public func sort<Comparable: Swift.Comparable>(
  _ comparables: (Comparable, Comparable)
) -> (Comparable, Comparable) {
  if comparables.0 <= comparables.1 {
    (comparables.0, comparables.1)
  } else {
    (comparables.1, comparables.0)
  }
}
