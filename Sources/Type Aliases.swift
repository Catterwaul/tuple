/// Expands `Value` to the shape of `Pack`
/// - Important: This is ***not*** just `Value`.
/// It's more like `(repeat each Value)`, which can't be represented in Swift yet.
/// This typealias is the workaround for that unimplemented feature.
public typealias Repeat<Value, each Pack> = Value

// MARK: - Tuple

/// A 2-tuple.
public typealias Tuple2<Element0, Element1> = (Element0, Element1)

/// A 3-tuple.
public typealias Tuple3<Element0, Element1, Element2> = (Element0, Element1, Element2)

/// A 4-tuple.
public typealias Tuple4<Element0, Element1, Element2, Element3> = (Element0, Element1, Element2, Element3)

// MARK: - Vectuple

/// A homogeneous 2-tuple.
public typealias Vectuple2<Element> = (Element, Element)

/// A homogeneous 3-tuple.
public typealias Vectuple3<Element> = (Element, Element, Element)

/// A homogeneous 4-tuple.
public typealias Vectuple4<Element> = (Element, Element, Element, Element)
