/// The first non-`nil` result
/// obtained from applying the given transformation to the elements of a homogeneous tuple.
///
/// - Parameter transform: A closure that takes an element of the tuple as
///   its argument and returns an optional transformed value.
@inlinable public func firstNonNil<Element, Result>(
  _ elements: Vectuple2<Element>,
  _ transform: (Element) throws -> Result?
) rethrows -> Result? {
  try transform(elements.0) ?? transform(elements.1)
}

/// The first non-`nil` element in a tuple.
///
/// - Parameter transform: A closure that takes an element of the tuple as
///   its argument and returns an optional transformed value.
@inlinable public func firstNonNil<Wrapped>(_ elements: Vectuple2<Wrapped?>) -> Wrapped? {
  elements.0 ?? elements.1
}

/// The first result, which does not throw an error,
/// obtained from applying the given transformation to the elements of a homogeneous tuple.
///
/// - Parameter transform: A closure that takes an element of the tuple as
///   its argument and returns a transformed value.
/// - Throws: `Error.allTransformationsThrow` if all transformations throw errors.
@inlinable public func firstNonThrowing<Element, Result>(
  _ elements: Vectuple2<Element>,
  _ transform: (Element) throws -> Result?
) throws -> Result? {
  try transform(elements.0) ?? (try? transform(elements.1))
}
