import Testing
import Tuplé

struct TypeMethodTests {
  @Test func equatable() {
    let tuple8 = (true, 2, "3", false, 5, "6", 7, "8")
    #expect(tuple8 == tuple8)

    // Modifying tuple8 and then comparing will not compile.
    let notTuple8 = (false, 2, "3", false, 5, "6", 7, "8")
    #expect(tuple8 != notTuple8)

    #expect(
      zip((true, 1, "2"), ("3", 4, false))
      !=
      ((false, "3"), (1, 4), ("2", false))
    )
  }

  @Test func comparable() {
    let forward = (1, 2, 3, 4, 5, 6, 7, 8)
    #expect(!(forward < forward))
    #expect(forward <= forward)
    #expect(!(forward > forward))
    #expect(forward >= forward)

    let reverse = (8, 7, 6, 5, 4, 3, 2, 1)
    #expect(forward < reverse)
    #expect(forward <= reverse)
    #expect(!(reverse < forward))
    #expect(!(reverse <= forward))
    #expect(reverse > forward)
    #expect(reverse >= forward)
    #expect(!(forward > reverse))
    #expect(!(forward >= reverse))
  }
}
