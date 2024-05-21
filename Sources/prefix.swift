/// The first 2 elements of a 3-tuple.
@inlinable public func prefix<Element0, Element1>(
  _ elements: (Element0, Element1, some Any)
) -> (Element0, Element1) {
  (elements.0, elements.1)
}

/// The first 2 elements of a 4-tuple.
@inlinable public func prefix<Element0, Element1>(
  _ elements: (Element0, Element1, some Any, some Any)
) -> (Element0, Element1) {
  (elements.0, elements.1)
}

/// The first 3 elements of a 4-tuple.
@inlinable public func prefix<Element0, Element1, Element2>(
  _ elements: (Element0, Element1, Element2, some Any)
) -> (Element0, Element1, Element2) {
  (elements.0, elements.1, elements.2)
}
