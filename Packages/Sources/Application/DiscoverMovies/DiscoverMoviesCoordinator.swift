import Factory
import SwiftUI

public enum DiscoverMoviesDestination {
    case detail(movieId: String)
}

public protocol DiscoverMoviesCoordinating: AnyObject {
    func navigate(to destination: DiscoverMoviesDestination) -> AnyView
}

final class DiscoverMoviesCoordinator: DiscoverMoviesCoordinating {
    @Injected(\.movieDetailBuilder) private var detailBuilder

    func navigate(to destination: DiscoverMoviesDestination) -> AnyView {
        switch destination {
        case .detail(let movieId):
            guard let detailBuilder else {
                assertionFailure("Dependency missing")
                return AnyView(EmptyView())
            }
            return detailBuilder.build(with: movieId)
        }
    }
}
