import XCTest
import Tuplé

final class TestCase: XCTestCase {
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
    ƒ(unlabeled(tuple2))

    let tuple3 = (🐱: (), (), ())
    func ƒ(_: (🐶: some Any, some Any, some Any)) { }
    ƒ(unlabeled(tuple3))

    let tuple4 = (🐱: (), (), (), ())
    func ƒ(_: (🐶: some Any, some Any, some Any, some Any)) { }
    ƒ(unlabeled(tuple4))
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
}
