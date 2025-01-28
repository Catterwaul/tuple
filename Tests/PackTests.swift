import Foundation
import Testing
import Tuplé

struct PackTests {
  @Test func init_projectedValue() {
    func ƒ<each Element>(@Pack _: (repeat each Element)) { }
    @Pack var void: Void = ()
    ƒ($_: $void)
  }

  @Test func codable() throws {
    @Pack var container = (1, true, "three")
    @Pack(
      projectedValue: try JSONDecoder().decode(
        Pack<Int, Bool, String>.self,
        from: JSONEncoder().encode($container)
      )
    ) var decoded
    #expect(decoded == container)
  }

  @Test func hashableAndEquatable() {
    let keys = {
      let bell = "bell"
      @Pack var trueKey = (bell, true)
      @Pack var falseKey = (bell, false)
      return (true: $trueKey, false: $falseKey)
    } ()

    #expect(keys.true != keys.false)

    let dictionary = [keys.true: "🔔", keys.false: "🔕"]
    #expect(dictionary[keys.true] == dictionary[keys.true])
  }
}
