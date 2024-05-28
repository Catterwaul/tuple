/// A 2-tuple with its elements in the reverse order.
@inlinable public func reversed<Element0, Element1>(
  _ elements: (Element0, Element1)
) -> (Element1, Element0) {
  (elements.1, elements.0)
}

/// A 3-tuple with its elements in the reverse order.
@inlinable public func reversed<Element0, Element1, Element2>(
  _ elements: (Element0, Element1, Element2)
) -> (Element2, Element1, Element0) {
  (elements.2, elements.1, elements.0)
}

/// A 4-tuple with its elements in the reverse order.
@inlinable public func reversed<Element0, Element1, Element2, Element3>(
  _ elements: (Element0, Element1, Element2, Element3)
) -> (Element3, Element2, Element1, Element0) {
  (elements.3, elements.2, elements.1, elements.0)
}
