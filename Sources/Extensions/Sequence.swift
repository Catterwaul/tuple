/// Tuples created from some of the elements of sequences.
public extension Sequence {
// MARK: - 2-tuple
  /// A homogeneous 2-tuple of this `Sequence`'s `Element`.
  typealias Tuple2 = Vectuple2<Element>
  
  /// A tuple containing the initial 2 elements of the sequence.
  ///
  /// - Throws: `.incorrectElementCount` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws(Error) -> Tuple2 { try tuple2Prefix().tuple }

// MARK: - 3-tuple
  /// A homogeneous 3-tuple of this `Sequence`'s `Element`.
  typealias Tuple3 = Vectuple3<Element>

  /// A tuple containing the initial 3 elements of the sequence.
  ///
  /// - Throws: `.incorrectElementCount` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws(Error) -> Tuple3 { try tuple3Prefix().tuple }

// MARK: - 4-tuple
  /// A homogeneous 4-tuple of this `Sequence`'s `Element`.
  typealias Tuple4 = Vectuple4<Element>

  /// A tuple containing the initial 4 elements of the sequence.
  ///
  /// - Throws: `.incorrectElementCount` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws(Error) -> Tuple4 { try tuple4Prefix().tuple }
}

private extension Sequence {
  private func tuple2Prefix() throws(Error) -> (tuple: Vectuple2<Element>, getNext: () -> Element?) {
    var iterator = makeIterator()
    let getNext = { iterator.next() }

    guard let _0 = getNext()
    else { throw .incorrectElementCount(expected: 2, actual: 0) }
    guard let _1 = getNext()
    else { throw .incorrectElementCount(expected: 2, actual: 1) }
    return ((_0, _1), getNext)
  }

  private func tuple3Prefix() throws(Error) -> (tuple: Vectuple3<Element>, getNext: () -> Element?) {
    do throws(Error) {
      let (tuple, getNext) = try tuple2Prefix()

      guard let element = getNext()
      else { throw .incorrectElementCount(expected: 3, actual: 2) }

      return (appending(tuple)(element), getNext)
    } catch .incorrectElementCount(_, let actual) {
      throw .incorrectElementCount(expected: 3, actual: actual)
    }
  }

  private func tuple4Prefix() throws(Error) -> (tuple: Vectuple4<Element>, getNext: () -> Element?) {
    do throws(Error) {
      let (tuple, getNext) = try tuple3Prefix()

      guard let element = getNext()
      else { throw .incorrectElementCount(expected: 4, actual: 3) }

      return (appending(tuple)(element), getNext)
    } catch .incorrectElementCount(_, let actual) {
      throw .incorrectElementCount(expected: 4, actual: actual)
    }
  }
}
