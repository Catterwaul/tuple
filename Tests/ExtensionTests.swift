import Testing
import Tuplé

@Suite private struct ExtensionTests {
  @Test func sequence_tuplePrefix() throws {
    let array = [0, 1, 2, 3]
    #expect(try array.tuplePrefix() == (0, 1))
    #expect(try array.tuplePrefix() == (0, 1, 2))
    #expect(try array.tuplePrefix() == (0, 1, 2, 3))
  }

  @Test func throwError() {
    func test(
      _ tuple: (Repeated<Void>) throws -> some Any,
      expected: Int,
      count: Int
    ) {
      #expect {
        try tuple(repeatElement((), count: count))
      } throws: { error in
        error as? Error == .incorrectElementCount(expected: expected, actual: count)
      }
    }

    for count in 0...1 {
      test({ try $0.tuplePrefix() as Tuple2 }, expected: 2, count: count)
    }

    for count in 0...2 {
      test({ try $0.tuplePrefix() as Tuple3 }, expected: 3, count: count)
    }

    for count in 0...3 {
      test({ try $0.tuplePrefix() as Tuple4 }, expected: 4, count: count)
    }
  }
}
