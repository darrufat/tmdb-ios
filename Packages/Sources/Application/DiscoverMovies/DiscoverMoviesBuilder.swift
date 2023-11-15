import Common
import SwiftUI

public protocol DiscoverMoviesBuilding {
    func build() -> AnyView
}

struct DiscoverMoviesBuilder: DiscoverMoviesBuilding {
    func build() -> AnyView {
        AnyView(
            DiscoverMoviesView(viewModel: .init())
        )
    }
}
