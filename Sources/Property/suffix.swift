/// The last 2 elements of a 3-tuple.
@inlinable public func suffix<Element1, Element2>(
  _ elements: (some Any, Element1, Element2)
) -> (Element1, Element2) {
  (elements.1, elements.2)
}

/// The last 2 elements of a 4-tuple.
@inlinable public func suffix<Element2, Element3>(
  _ elements: (some Any, some Any, Element2, Element3)
) -> (Element2, Element3) {
  (elements.2, elements.3)
}

/// The last 3 elements of a 4-tuple.
@inlinable public func suffix<Element1, Element2, Element3>(
  _ elements: (some Any, Element1, Element2, Element3)
) -> (Element1, Element2, Element3) {
  (elements.1, elements.2, elements.3)
}
