/// Adds an element to the end of a 2-tuple, resulting in a 3-tuple.
@inlinable public func append<Element0, Element1, Element2>(
  _ prefix: (Element0, Element1), _ last: Element2
) -> (Element0, Element1, Element2) {
  (prefix.0, prefix.1, last)
}

/// Adds an element to the end of a 3-tuple, resulting in a 4-tuple.
@inlinable public func append<Element0, Element1, Element2, Element3>(
  _ prefix: (Element0, Element1, Element2), _ last: Element3
) -> (Element0, Element1, Element2, Element3) {
  (prefix.0, prefix.1, prefix.2, last)
}
