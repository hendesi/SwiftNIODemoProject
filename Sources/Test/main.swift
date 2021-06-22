import AssociatedTypeRequirementsVisitor
import SwiftUI

private let converter = AnyViewConverter()

extension AnyView {
    init?(_ value: Any) {
        guard let view = converter(value) else { return nil }
        self = view
    }
}

private struct AnyViewConverter : ViewVisitor {
    // Provide a function that can be called with all the necessary type information
    func callAsFunction<T : View>(_ value: T) -> AnyView {
        print(#function)
        return AnyView(value)
    }
}

let _ = converter.callAsFunction(12)
