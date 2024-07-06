import Testing
import Tuplé

@Suite private struct PropertyTests {
  @Test func test_enumerated() {
    let enumerated = enumerated(("0️⃣", 1, 2.0))
    #expect(enumerated.0 == (offset: 0, element: "0️⃣"))
    #expect(enumerated.1 == (offset: 1, element: 1))
    #expect(enumerated.2 == (offset: 2, element: 2.0))
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
