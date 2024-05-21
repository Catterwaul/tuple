/// Transform each element of a 2-tuple.
@inlinable public func map<Element, Transformed>(
  _ elements: Tuple2<Element>,
  _ transform: (Element) throws -> Transformed
) rethrows -> Tuple2<Transformed> {
  try (transform(elements.0), transform(elements.1))
}

/// Transform each element of a 3-tuple.
@inlinable public func map<Element, Transformed>(
  _ elements: Tuple3<Element>,
  _ transform: (Element) throws -> Transformed
) rethrows -> Tuple3<Transformed> {
  try append(
    map(prefix(elements), transform),
    transform(elements.2)
  )
}

/// Transform each element of a 4-tuple.
@inlinable public func map<Element, Transformed>(
  _ elements: Tuple4<Element>,
  _ transform: (Element) throws -> Transformed
) rethrows -> Tuple4<Transformed> {
  try append(
    map(prefix(elements), transform),
    transform(elements.3)
  )
}
