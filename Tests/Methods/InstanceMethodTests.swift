import Testing
import Tuplé

struct InstanceMethodTests {
  @Test func test_callAsFunction() throws {
    struct 🇪🇨: Equatable {
      // MARK: Equatables
      let eq = "🎛"
      let u = 1.0 / 1_000_000
      let al = 13
      let s = "💰"

      let breaksEquatableSynthesis: Void = ()

      static func == (ecuador0: Self, ecuador1: Self) -> Bool {
        let getProperties = (
          \.eq as (Self) -> _,
          \.u as (Self) -> _,
          \.al as (Self) -> _,
          \.s as (Self) -> _
        )
        return callAsFunction(getProperties)(ecuador0) == callAsFunction(getProperties)(ecuador1)
      }
    }

    #expect(🇪🇨() == 🇪🇨())

    let getThrowingProperties = (
      \.eq as (🇪🇨) throws -> _,
      \.u as (🇪🇨) -> _,
      \.al as (🇪🇨) -> _,
      \.s as (🇪🇨) -> _
    )

    _ = try callAsFunction(getThrowingProperties)(🇪🇨())
  }

  @Test func test_map() throws {
    let tuple4 = (0, 1, 2, 3)

    #expect(
      map(tuple4)() { $0 + 1 } == (1, 2, 3, 4)
    )
    #expect(
      map(prefix(tuple4))() { $0 + 1 } == (1, 2, 3)
    )
    #expect(
      map(prefix(suffix(tuple4)))() { $0 + 1 } == (2, 3)
    )

    func add1(_ int: Int) throws -> Int { int + 1 }
    #expect(
      try map(tuple4)(add1) == (1, 2, 3, 4)
    )
  }

  @Test func test_repeat() throws {
    let value = "💰"
    #expect(isEmpty(`repeat`(())(value)))
    #expect(`repeat`((true, 2, "3️⃣"))(value) == (value, value, value))
  }
}
