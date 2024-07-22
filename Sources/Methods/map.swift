/// Transform each element of a 2-tuple.
@_disfavoredOverload @inlinable public func map<Element, Transformed, Error>(
  _ elements: Vectuple2<Element>
) -> ((Element) throws(Error) -> Transformed) throws(Error) -> Vectuple2<Transformed> {
  { transform in try (transform(elements.0), transform(elements.1)) }
}

/// Transform each element of a 2-tuple.
/// - Bug: This overload should not be necessary, but the compiler crashes
/// when trying to use the other similar one when `Error` would be `Never`,
/// which is the special case represented by this error-less signature.
@_documentation(visibility: private)
@inlinable public func map<Element, Transformed>(
  _ elements: Vectuple2<Element>
) -> ((Element) -> Transformed) -> Vectuple2<Transformed> {
  { transform in (transform(elements.0), transform(elements.1)) }
}

// MARK: - 3-tuple

/// Transform each element of a 3-tuple.
@_disfavoredOverload @inlinable public func map<Element, Transformed, Error>(
  _ elements: Vectuple3<Element>
) -> ((Element) throws(Error) -> Transformed) throws(Error) -> Vectuple3<Transformed> {
  { transform in
    let prefix = try map(prefix(elements))(transform)
    return try appending(prefix)(transform(elements.2))
  }
}

/// Transform each element of a 3-tuple.
/// - Bug: This overload should not be necessary, but the compiler crashes
/// when trying to use the other similar one when `Error` would be `Never`,
/// which is the special case represented by this error-less signature.
@_documentation(visibility: private)
@inlinable public func map<Element, Transformed>(
  _ elements: Vectuple3<Element>
) -> ((Element) -> Transformed) -> Vectuple3<Transformed> {
  { transform in
    let prefix = map(prefix(elements))(transform)
    return appending(prefix)(transform(elements.2))
  }
}

// MARK: - 4-tuple

/// Transform each element of a 4-tuple.
@_disfavoredOverload @inlinable public func map<Element, Transformed, Error>(
  _ elements: Vectuple4<Element>
) -> ((Element) throws(Error) -> Transformed) throws(Error) -> Vectuple4<Transformed> {
  { transform in
    let prefix: Tuple3 = try map(prefix(elements))(transform)
    return try appending(prefix)(transform(elements.3))
  }
}

/// Transform each element of a 4-tuple.
/// - Bug: This overload should not be necessary, but the compiler crashes
/// when trying to use the other similar one when `Error` would be `Never`,
/// which is the special case represented by this error-less signature.
@_documentation(visibility: private)
@inlinable public func map<Element, Transformed>(
  _ elements: Vectuple4<Element>
) -> ((Element) -> Transformed) -> Vectuple4<Transformed> {
  { transform in
    let prefix: Tuple3 = map(prefix(elements))(transform)
    return appending(prefix)(transform(elements.3))
  }
}
