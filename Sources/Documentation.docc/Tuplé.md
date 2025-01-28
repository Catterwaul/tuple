# ``Tuplé``

Bridge the gap between tuples and [Collections](https://developer.apple.com/documentation/swift/collections).

Despite tuples being very much like fixed-count arrays, they are not equipped with much of the built-in functionality that is provided for any type of collection in the standard library. ☹️ 

This package addresses some of the omissions, bringing tuples and collections closer to feature parity.

#### "Geneity"

Swift's collections are homogeneous, meaning they're generic over their [`Element`](https://developer.apple.com/documentation/swift/collection/element). Some of what's in this package does require the tuples you're working with to be homogeneous, as well.

But it's generally no more complex to support working with heterogeneous tuples, so this package defers to the choice of maximum versatility, supporting homogeneous tuples as a subset of heterogenous ones.

For example, the code for reversing an `(Int, String)`: 
```swift 
reversed((1, "Two"))
``` 
…also supports `(Int, Int)`: 
```swift
reversed((1, 2))
```

#### Element Count

This package will support arbitrary-count tuples, incorporating the evolution of [parameter packs](https://github.com/apple/swift-evolution/blob/main/proposals/0393-parameter-packs.md), when possible. 

Otherwise, the cap for support is tuples with **4 elements**. This is the de facto size limit found in 3D graphics frameworks such as [RealityKit](https://developer.apple.com/documentation/realitykit) and libraries such as [SIMD](https://developer.apple.com/documentation/swift/simd-vector-types) and  [Spatial](https://developer.apple.com/documentation/spatial). Supporting visionOS development by filling in tuple-shaped holes in that Apple-provided software is a primary motivator for this package, but it is otherwise unrelated to graphics.

##### Usage Examples

You've got the source code, so aside from reading this documentation, see the **Tests** folder for example usage! 😺

## Topics

- <doc:Type-Aliases>
- <doc:Properties>
- <doc:Instance-Methods>
- <doc:Type>
- <doc:Pack>
- ``Swift/Sequence``
