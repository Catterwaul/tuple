import Testing
import Tuplé

struct TypeMethodTests {
  @Test func equals() {
    let tuple8 = (true, 2, "3", false, 5, "6", 7, "8")
    #expect(tuple8 == tuple8)
  }
}
