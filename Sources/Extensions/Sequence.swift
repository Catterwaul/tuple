/// Tuples created from some of the elements of sequences.
public extension Sequence {
// MARK: - 2-tuple
  typealias Tuple2 = Vectuple2<Element>
  
  /// A tuple containing the initial 2 elements of the sequence.
  ///
  /// - Throws: ``Error.incorrectElementCount`` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws -> Tuple2 { try tuple2Prefix().tuple }

// MARK: - 3-tuple
  typealias Tuple3 = Vectuple3<Element>

  /// A tuple containing the initial 3 elements of the sequence.
  ///
  /// - Throws: ``Error.incorrectElementCount`` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws -> Tuple3 { try tuple3Prefix().tuple }

// MARK: - 4-tuple
  typealias Tuple4 = Vectuple4<Element>

  /// A tuple containing the initial 4 elements of the sequence.
  ///
  /// - Throws: ``Error.incorrectElementCount`` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws -> Tuple4 { try tuple4Prefix().tuple }
}

private extension Sequence {
  private func tuple2Prefix() throws -> (tuple: Vectuple2<Element>, getNext: () -> Element?) {
    var iterator = makeIterator()
    let getNext = { iterator.next() }

    guard let _0 = getNext()
    else { throw Error.incorrectElementCount(expected: 2, actual: 0) }
    guard let _1 = getNext()
    else { throw Error.incorrectElementCount(expected: 2, actual: 1) }
    return ((_0, _1), getNext)
  }

  private func tuple3Prefix() throws -> (tuple: Vectuple3<Element>, getNext: () -> Element?) {
    do {
      let (tuple, getNext) = try tuple2Prefix()

      guard let element = getNext()
      else { throw Error.incorrectElementCount(expected: 3, actual: 2) }

      return (appending(tuple)(element), getNext)
    } catch Error.incorrectElementCount(_, let actual) {
      throw Error.incorrectElementCount(expected: 3, actual: actual)
    }
  }

  private func tuple4Prefix() throws -> (tuple: Vectuple4<Element>, getNext: () -> Element?) {
    do {
      let (tuple, getNext) = try tuple3Prefix()

      guard let element = getNext()
      else { throw Error.incorrectElementCount(expected: 4, actual: 3) }

      return (appending(tuple)(element), getNext)
    } catch Error.incorrectElementCount(_, let actual) {
      throw Error.incorrectElementCount(expected: 4, actual: actual)
    }
  }
}
