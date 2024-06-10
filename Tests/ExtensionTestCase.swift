import XCTest
import Tuplé

final class ExtensionTestCase: XCTestCase {
  func test_Sequence_tuplePrefix() throws {
    let array = [0, 1, 2, 3]
    XCTAssert(try array.tuplePrefix() == (0, 1))
    XCTAssert(try array.tuplePrefix() == (0, 1, 2))
    XCTAssert(try array.tuplePrefix() == (0, 1, 2, 3))

    func test(
      _ tuple: (Repeated<Void>) throws -> some Any,
      expected: Int,
      count: Int
    ) {
      XCTAssertThrowsError(try tuple(repeatElement((), count: count))) { error in
        XCTAssertEqual(
          error as? Error,
          .incorrectElementCount(expected: expected, actual: count)
        )
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
