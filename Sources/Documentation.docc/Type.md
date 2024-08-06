# Type Methods, Properties, and Operators

Functions that would be type methods if tuples could be extended.

## 

Some of the functions in this package should be considered "type", AKA "static". If tuples were a named type, we could extend them with real methods that incorporate dot syntax.

For example, we'd *like* to be able to write:  

```swift
Vectuple3<Double>.repeat("💕")
```

…but the best we can do is:

```swift
repeat(Vectuple3<Double>.self, "💕")
```

### Operators

It would be nice to nest operators within tuples. Fortunately, it looks exactly the same with current capabilities as it would if we could do that.

## Topics

- ``count(_:)-kjt3``
- ``isEmpty(_:)-81s9c``
- ``repeat(_:_:)``
- ``==(_:_:)``
- ``!=(_:_:)``
