/// Tuples created from some of the elements of sequences.
public extension Sequence {
  /// A tuple containing the initial 2 elements of the sequence.
  ///
  /// - Throws: `Tuplé.Error.incorrectElementCount` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws -> Tuple2<Element> { try tuple2Prefix().tuple }

  /// A tuple containing the initial 3 elements of the sequence.
  ///
  /// - Throws: `Tuplé.Error.incorrectElementCount` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws -> Tuple3<Element> { try tuple3Prefix().tuple }

  /// A tuple containing the initial 4 elements of the sequence.
  ///
  /// - Throws: `Tuplé.Error.incorrectElementCount` if there are not enough elements to populate the tuple.
  func tuplePrefix() throws -> Tuple4<Element> { try tuple4Prefix().tuple }
}

private extension Sequence {
  private func tuple2Prefix() throws -> (tuple: Tuple2<Element>, getNext: () -> Element?) {
    var iterator = makeIterator()
    let getNext = { iterator.next() }

    guard let _0 = getNext()
    else { throw Error.incorrectElementCount(expected: 2, actual: 0) }
    guard let _1 = getNext()
    else { throw Error.incorrectElementCount(expected: 2, actual: 1) }
    return ((_0, _1), getNext)
  }

  private func tuple3Prefix() throws -> (tuple: Tuple3<Element>, getNext: () -> Element?) {
    do {
      let (tuple, getNext) = try tuple2Prefix()

      guard let element = getNext()
      else { throw Error.incorrectElementCount(expected: 3, actual: 2) }

      return (append(tuple)(element), getNext)
    } catch Error.incorrectElementCount(_, let actual) {
      throw Error.incorrectElementCount(expected: 3, actual: actual)
    }
  }

  private func tuple4Prefix() throws -> (tuple: Tuple4<Element>, getNext: () -> Element?) {
    do {
      let (tuple, getNext) = try tuple3Prefix()

      guard let element = getNext()
      else { throw Error.incorrectElementCount(expected: 4, actual: 3) }

      return (append(tuple)(element), getNext)
    } catch Error.incorrectElementCount(_, let actual) {
      throw Error.incorrectElementCount(expected: 4, actual: actual)
    }
  }
}
