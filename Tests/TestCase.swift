import XCTest
@testable import Tuplé

final class TestCase: XCTestCase {
  func test_prefix() {
    let tuple2 = (0, 1)
    let tuple3 = (0, 1, 2)
    XCTAssert(prefix(tuple3) == tuple2)
    let tuple4 = (0, 1, 2, 3)
    XCTAssert(prefix(tuple4) == tuple2)
    XCTAssert(prefix(tuple4) == tuple3)
  }
}
