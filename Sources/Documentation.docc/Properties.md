# Properties

Functions that would be properties if tuples could be extended.

## 

Some of the functions in this package should be considered "properties". If tuples were a named type, we could extend them to add real properties that use dot syntax, and no trailing parentheses.

For example, to get a "reversed" version of a tuple, we'd *like* to be able to write:  

```swift
let tuple = (1, 2, 3) 
tuple.reversed
```

…but the best we can do is:

```swift
reversed(tuple)
```

#### Recommended Mental Model for "Tuple Properties": Key Path Closures

Say that we want to get the [`count`](https://developer.apple.com/documentation/swift/collection/count-4l4qk) of a `String Array`. Because `Array` is a named type, Swift provides that functionality using this syntax: 

```swift
["🧛🏼‍♂️"].count
```

But a closure can represent the same concept. And [a key path expression can be used as a closure](https://github.com/apple/swift-evolution/blob/main/proposals/0249-key-path-literal-function-expressions.md) :

```swift
let count: ([String]) -> Int = \.count
count(["🧛🏼‍♂️"])
```

That's how the package authors think about the functions cataloged below.

## Topics

- ``count(_:)-22au4``
- ``enumerated(_:)``
- ``isEmpty(_:)-ls06``

### flattened
- ``flattened(_:)-6s3ka``
- ``flattened(_:)-84b0s``
- ``flattened(_:)-l8wf``

### prefix
- ``prefix(_:)-931zj``
- ``prefix(_:)-2oq89``
- ``prefix(_:)-7o0x3``

### reversed
- ``reversed(_:)-8btr4``
- ``reversed(_:)-3qjbt``
- ``reversed(_:)-5iq4g``

### suffix
- ``suffix(_:)-9ju08``
- ``suffix(_:)-9ngfq``
- ``suffix(_:)-2pte7``

### unlabeled
- ``unlabeled(_:)-3ebq1``
- ``unlabeled(_:)-5dkwy``
- ``unlabeled(_:)-6wp2x``
