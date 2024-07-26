import Testing
import Tuplé

struct FunctionTests {
  @Test func test_zip() {
    #expect(
      zip((true, 1, "2"), ("3", 4, false))
      ==
      ((true, "3"), (1, 4), ("2", false))
    )
  }
}
