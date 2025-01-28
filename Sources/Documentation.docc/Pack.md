# ``Pack``

## 

You can technically use this to wrap anything, and add extensions to it. But its main utility is in adding protocol conformance to a wrapper around unlabeled tuples. (The tuples themselves [cannot conform to protocols, yet](https://forums.swift.org/t/pitch-user-defined-tuple-conformances/67154)).

For example, as you can see in `PackTests`, this allows for [encoding](<doc:Pack/encode(to:)>)
 and [decoding](<doc:Pack/init(from:)>) tuples, and using them as `Dictionary` keys.
