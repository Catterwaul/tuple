/// A 2-tuple with its labels removed.
/// - Parameter tuple: A tuple that may have at least one label.
@inlinable public func unlabeled<Element0, Element1>(
  _ tuple: (Element0, Element1)
) -> (Element0, Element1) {
  tuple
}

/// A 3-tuple with its labels removed.
/// - Parameter tuple: A tuple that may have at least one label.
@inlinable public func unlabeled<Element0, Element1, Element2>(
  _ tuple: (Element0, Element1, Element2)
) -> (Element0, Element1, Element2) {
  tuple
}

/// A 4-tuple with its labels removed.
/// - Parameter tuple: A tuple that may have at least one label.
@inlinable public func unlabeled<Element0, Element1, Element2, Element3>(
  _ tuple: (Element0, Element1, Element2, Element3)
) -> (Element0, Element1, Element2, Element3) {
  tuple
}
