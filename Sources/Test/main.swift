import AssociatedTypeRequirementsVisitor

private let hasher = AnyHasher()

func hashValue(value: Any) -> Int {
    // There's a function `AnyHasher.callAsFunction(_:Any) -> Int?`
    return hasher(value) ?? 0
}

struct AnyHasher: HashableVisitor {
    // This function will called by `callAsFunction(_:Any)` if the input conforms to hashable
    func callAsFunction<T : Hashable>(_ value: T) -> Int {
        return value.hashValue
    }
}

print(hashValue(value: 12))
