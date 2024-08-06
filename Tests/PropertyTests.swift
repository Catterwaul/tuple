import Testing
import Tuplé

struct PropertyTests {
  @Test func test_count() {
    #expect(count(()) == 0)
    #expect(count(1) == 1)
    #expect(count((1, 2)) == 2)
    #expect(count((1, 2, 3)) == 3)

    #expect(count(Void.self) == 0)
    #expect(count(Int.self) == 1)
    #expect(count((Int, Int).self) == 2)
    #expect(count((Int, Int, Int).self) == 3)
  }

  @Test func test_enumerated() {
    #expect(
      enumerated(("0️⃣", 1, 2.0)) == (
        (offset: 0, element: "0️⃣"),
        (offset: 1, element: 1),
        (offset: 2, element: 2)
      )
    )
  }

  @Test func test_flattened() {
    let tuple2 = ((00, 01), (10, 11))
    #expect(flattened(tuple2) == (00, 01, 10, 11))
    let tuple3 = appending(tuple2)((20, 21))
    #expect(flattened(tuple3) == (00, 01, 10, 11, 20, 21))
    let tuple4 = appending(tuple3)((30, 31))
    #expect(flattened(tuple4) == (00, 01, 10, 11, 20, 21, 30, 31))
  }

  @Test func test_isEmpty() throws {
    #expect(isEmpty(Void.self))
    let void: Void = (())
    #expect(isEmpty(void))

    #expect(!isEmpty((Void, Void).self))
    let twoVoids = ((), ())
    #expect(!isEmpty(twoVoids))
  }

  @Test func test_prefix() {
    let tuple2 = (0, 1)
    let tuple3 = (0, 1, 2)
    #expect(prefix(tuple3) == tuple2)
    let tuple4 = (0, 1, 2, 3)
    #expect(prefix(tuple4) == tuple2)
    #expect(prefix(tuple4) == tuple3)
  }

  @Test func removeLabels() {
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

  @Test func reverse() {
    #expect(reversed((1, "2")) == ("2", 1))
    #expect(reversed((1, 2, 3)) == (3, 2, 1))
    #expect(reversed((1, 2, 3, 4)) == (4, 3, 2, 1))
  }

  @Test func test_suffix() {
    let tuple2 = (2, 3)
    let tuple3 = (1, 2, 3)
    #expect(suffix(tuple3) == tuple2)
    let tuple4 = (0, 1, 2, 3)
    #expect(suffix(tuple4) == tuple2)
    #expect(suffix(tuple4) == tuple3)
  }
}
