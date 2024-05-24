/// Transform each element of a 2-tuple.
@inlinable public func map<Element, Transformed>(
  _ elements: Tuple2<Element>
) -> ((Element) -> Transformed) -> Tuple2<Transformed> {
  { transform in (transform(elements.0), transform(elements.1)) }
}

/// Transform each element of a 2-tuple.
@_disfavoredOverload @inlinable public func map<Element, Transformed>(
  _ elements: Tuple2<Element>
) -> ((Element) throws -> Transformed) throws -> Tuple2<Transformed> {
  { transform in try (transform(elements.0), transform(elements.1)) }
}

// MARK: - 3-tuple

/// Transform each element of a 3-tuple.
@inlinable public func map<Element, Transformed>(
  _ elements: Tuple3<Element>
) -> ((Element) -> Transformed) -> Tuple3<Transformed> {
  { transform in 
    append(map(prefix(elements))(transform))(transform(elements.2))
  }
}

/// Transform each element of a 3-tuple.
@_disfavoredOverload @inlinable public func map<Element, Transformed>(
  _ elements: Tuple3<Element>
) -> ((Element) throws -> Transformed) throws -> Tuple3<Transformed> {
  { transform in
    try append(map(prefix(elements))(transform))(transform(elements.2))
  }
}

// MARK: - 4-tuple

/// Transform each element of a 4-tuple.
@inlinable public func map<Element, Transformed>(
  _ elements: Tuple4<Element>
) -> ((Element) -> Transformed) -> Tuple4<Transformed> {
  { transform in append(map(prefix(elements))(transform))(transform(elements.3)) }
}

/// Transform each element of a 4-tuple.
@_disfavoredOverload @inlinable public func map<Element, Transformed>(
  _ elements: Tuple4<Element>
) -> ((Element) throws -> Transformed) throws -> Tuple4<Transformed> {
  { transform in try append(map(prefix(elements))(transform))(transform(elements.3)) }
}
