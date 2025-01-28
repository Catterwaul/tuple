/// A workaround for not being able to extend tuples or parameter packs directly.
///
/// - Note: Only single values or unlabeled tuples are supported.
@propertyWrapper public struct Pack<each Element> {
  public init(wrappedValue: (repeat each Element)) {
    self.wrappedValue = wrappedValue
  }
  
  public init(projectedValue: Self) { self = projectedValue }

  public var wrappedValue: (repeat each Element)
  public var projectedValue: Self { self }
}

// MARK: - Codable
extension Pack: Encodable where repeat each Element: Encodable {
  public func encode(to encoder: any Encoder) throws {
    var container = encoder.unkeyedContainer()
    repeat try container.encode(each wrappedValue)
  }
}

extension Pack: Decodable where repeat each Element: Decodable {
  public init(from decoder: any Decoder) throws {
    var container = try decoder.unkeyedContainer()
    wrappedValue = (repeat try container.decode((each Element).self))
  }
}

// MARK: - Equatable
extension Pack: Equatable where repeat each Element: Equatable {
  public static func == (pack0: Self, pack1: Self) -> Bool {
    for elements in repeat (each pack0.wrappedValue, each pack1.wrappedValue) {
      guard elements.0 == elements.1 else { return false }
    }
    return true
  }
}

// MARK: - Hashable
extension Pack: Hashable where repeat each Element: Hashable {
  public func hash(into hasher: inout Hasher) {
    repeat hasher.combine(each wrappedValue)
  }
}
