import XCTest
@testable import Tuplé

final class TestCase: XCTestCase {
  func test_map() {
    let tuple4 = (0, 1, 2, 3)
    XCTAssert(
      map(tuple4)() { $0 + 1 } == (1, 2, 3, 4)
    )
    XCTAssert(
      map(prefix(tuple4))() { $0 + 1 } == (1, 2, 3)
    )
    XCTAssert(
      map(prefix(suffix(tuple4)))() { $0 + 1 } == (2, 3)
    )

    func add1(_ int: Int) throws -> Int { int + 1 }
    XCTAssert(
      try map(tuple4)(add1) == (1, 2, 3, 4)
    )
  }

  func test_prefix() {
    let tuple2 = (0, 1)
    let tuple3 = (0, 1, 2)
    XCTAssert(prefix(tuple3) == tuple2)
    let tuple4 = (0, 1, 2, 3)
    XCTAssert(prefix(tuple4) == tuple2)
    XCTAssert(prefix(tuple4) == tuple3)
  }

  func test_removeLabels() {
    let tuple2 = (🐱: (), ())
    func ƒ(_: (🐶: some Any, some Any)) { }
    ƒ(removeLabels(tuple2))

    let tuple3 = (🐱: (), (), ())
    func ƒ(_: (🐶: some Any, some Any, some Any)) { }
    ƒ(removeLabels(tuple3))

    let tuple4 = (🐱: (), (), (), ())
    func ƒ(_: (🐶: some Any, some Any, some Any, some Any)) { }
    ƒ(removeLabels(tuple4))
  }

  func test_reverse() {
    XCTAssert(reverse((1, 2)) == (2, 1))
    XCTAssert(reverse((1, 2, 3)) == (3, 2, 1))
    XCTAssert(reverse((1, 2, 3, 4)) == (4, 3, 2, 1))
  }

  func test_suffix() {
    let tuple2 = (2, 3)
    let tuple3 = (1, 2, 3)
    XCTAssert(suffix(tuple3) == tuple2)
    let tuple4 = (0, 1, 2, 3)
    XCTAssert(suffix(tuple4) == tuple2)
    XCTAssert(suffix(tuple4) == tuple3)
  }

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
          Error.incorrectElementCount(expected: expected, actual: count)
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
