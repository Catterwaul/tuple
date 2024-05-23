/// Reverse the order of the elements in the tuple.
@inlinable public func reverse<Element0, Element1>(
  _ elements: (Element0, Element1)
) -> (Element1, Element0) {
  (elements.1, elements.0)
}

/// Reverse the order of the elements in the tuple.
@inlinable public func reverse<Element0, Element1, Element2>(
  _ elements: (Element0, Element1, Element2)
) -> (Element2, Element1, Element0) {
  (elements.2, elements.1, elements.0)
}

/// Reverse the order of the elements in the tuple.
@inlinable public func reverse<Element0, Element1, Element2, Element3>(
  _ elements: (Element0, Element1, Element2, Element3)
) -> (Element3, Element2, Element1, Element0) {
  (elements.3, elements.2, elements.1, elements.0)
}
