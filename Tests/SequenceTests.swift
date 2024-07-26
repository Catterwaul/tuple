import Testing
import Tuplé

struct SequenceTests {
  @Test func tuplePrefix() throws {
    let array = [0, 1, 2, 3]
    #expect(try array.tuplePrefix() == (0, 1))
    #expect(try array.tuplePrefix() == (0, 1, 2))
    #expect(try array.tuplePrefix() == (0, 1, 2, 3))
  }

  @Test(arguments: 0..<2) func tuplePrefix2_throw(actualCount: Int) {
    test({ try $0.tuplePrefix() as Tuple2 }, actualCount: actualCount)
  }

  @Test(arguments: 0..<3) func tuplePrefix3_throw(actualCount: Int) {
    test({ try $0.tuplePrefix() as Tuple3 }, actualCount: actualCount)
  }

  @Test(arguments: 0..<4) func tuplePrefix4_throw(actualCount: Int) {
    test({ try $0.tuplePrefix() as Tuple4 }, actualCount: actualCount)
  }

  private func test<Prefix>(
    _ prefix: (Repeated<Void>) throws -> Prefix,
    actualCount: Int
  ) {
    #expect(throws: MissingElementsError(actualCount: actualCount)) {
      try prefix(repeatElement((), count: actualCount))
    }
  }
}
