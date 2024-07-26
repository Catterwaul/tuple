/// Adds an element to the end of a tuple.
@inlinable public func appending<each Element, Last>(
  _ prefix: (repeat each Element)
) -> (_ last: Last) -> (repeat each Element, Last) {
  { last in (repeat each prefix, last) }
}
