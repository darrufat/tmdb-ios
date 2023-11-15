import Common
import Factory

extension Container {
    public var discoverMoviesBuilder: Factory<DiscoverMoviesBuilding> {
        self { DiscoverMoviesBuilder() }
    }

    var discoverMoviesCoordinator: Factory<DiscoverMoviesCoordinating> {
        self { DiscoverMoviesCoordinator() }
    }

    var movieDetailBuilder: Factory<MovieDetailBuilding?> {
        self { .none }
    }
}
