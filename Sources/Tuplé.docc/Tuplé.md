# ``Tuplé``

Bridge the gap between tuples and [Collections](https://developer.apple.com/documentation/swift/collections).

See `Tests` folder for example usage!

Despite tuples being very much like fixed-count arrays, they don't have anywhere close to the same level of built-in functionality as is provided for any type of collection in the standard library. ☹️ This package addresses some of the omissions, to bring tuples and collections closer to feature parity. 

#### "Geneity"

Swift's collections are homogeneous, meaning they're generic over their [`Element`](https://developer.apple.com/documentation/swift/collection/element). Some of what's in this package does require the tuples you're working with to be homogeneous, as well. When that's the case, the package makes use of <doc:TypeAliases>.

But even if homogeneous tuples may be the most common use case, for certain code you'll find here, it's often no more complex to support working with heterogeneous tuples, so this package defers to the choice of maximum versatility, supporting homogeneous tuples as a subset of heterogenous ones.

For example, the code for reversing an `(Int, String)`: 
```swift 
reversed((1, "Two"))
``` 
…also supports `(Int, Int)`: 
```swift
reversed((1, 2))
```

#### Element Count

If ever possible, this package will support arbitrary-length tuples, incorporating the evolution of [parameter packs](https://github.com/apple/swift-evolution/blob/main/proposals/0393-parameter-packs.md). Currently, the cap for support is tuples with **4 elements**. This is the size limit found in 3D graphics frameworks such as [RealityKit](https://developer.apple.com/documentation/realitykit) and libraries such as [Spatial](https://developer.apple.com/documentation/spatial).  Supporting visionOS development using that Apple-provided software, while it remains incomplete, is a primary motivator for this package, but it is otherwise unrelated to graphics.

## Topics

- <doc:TypeAliases>
- <doc:Properties>
- <doc:Methods>
- ``Swift/Sequence``
- ``Error``
