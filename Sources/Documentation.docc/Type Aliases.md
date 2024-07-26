# Type Aliases 

Shorthand syntax for tuples.

## 

Say you want the initial elements of a sequence, as a tuple. You *can* disambiguate the overloads of `tuplePrefix` without type aliases. But even with type placeholders, that's not the easiest thing to make sense of, or to ensure it's been written correctly:

```swift
let sequence = 1...5
try sequence.tuplePrefix() as (_, _)
try sequence.tuplePrefix() as (_, _, _, _)
```

Type aliases help.

```swift
try sequence.tuplePrefix() as Tuple2
try sequence.tuplePrefix() as Tuple4
```

While it is possible to be even more explicit…

```swift
try sequence.tuplePrefix() as Vectuple2
try sequence.tuplePrefix() as Vectuple4
```

…it's often not necessary. A `Vectuple3` ***is*** a `Tuple3`. When the disambiguation only has to do with element count, the extra restriction on homogeneity is implicit.

### Count Suffix in Names

All of these type aliases end with a number. But, for example, a `Tuple3` does not represent something actually called a "Tuple 3." Instead, its real name is "3-Tuple". In Swift, as with most programming languages, you just can't use numbers at the beginning, or hyphens at all, for type names. The common convention is to move the number to the end, instead. We're sticking with that.

## Topics

- ``Repeat``

### Tuple
- ``Tuple2``
- ``Tuple3``
- ``Tuple4``

### Vectuple

When a type is defined for homogeneous data, of known count, it's often called a "Vector". But these are not named types; they're just type aliases for tuples that represent the same concept. So their name is a hybrid of "Vector" and "tuple".

- ``Vectuple2``
- ``Vectuple3``
- ``Vectuple4``
