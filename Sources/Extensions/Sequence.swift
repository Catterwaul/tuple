import Thrappture

/// Tuples created from some of the elements of sequences.
public extension Sequence {
// MARK: - 2-tuple
  /// A homogeneous 2-tuple of this `Sequence`'s `Element`.
  typealias Tuple2 = Vectuple2<Element>
  
  /// A tuple containing the initial 2 elements of the sequence.
  func tuplePrefix() throws(MissingElementsError) -> Tuple2 { try _tuplePrefix() }

// MARK: - 3-tuple
  /// A homogeneous 3-tuple of this `Sequence`'s `Element`.
  typealias Tuple3 = Vectuple3<Element>

  /// A tuple containing the initial 3 elements of the sequence.
  func tuplePrefix() throws(MissingElementsError) -> Tuple3 { try _tuplePrefix() }

// MARK: - 4-tuple
  /// A homogeneous 4-tuple of this `Sequence`'s `Element`.
  typealias Tuple4 = Vectuple4<Element>

  /// A tuple containing the initial 4 elements of the sequence.
  func tuplePrefix() throws(MissingElementsError) -> Tuple4 { try _tuplePrefix() }
}

// MARK: - private
private extension Sequence {
  /// - Note: This will be necessary until parameter packs support homogeneity.
  func _tuplePrefix<each Element>() throws(MissingElementsError) -> (repeat each Element) {
    var iterator = makeIterator()
    var actualCount = 0

    do {
      func next() throws -> Self.Element {
        let next = try iterator.next().get()
        actualCount += 1
        return next
      }
      return (repeat try next() as! each Element)
    } catch {
      throw MissingElementsError(actualCount: actualCount)
    }
  }
}

// MARK: - MissingElementsError
/// A representation of there not being enough elements to populate a tuple.
public struct MissingElementsError: Error & Equatable {
  /// - Parameter actualCount: How many elements are actually present.
  public init(actualCount: Int) {
    self.actualCount = actualCount
  }

  /// How many elements are actually present.
  let actualCount: Int
}
