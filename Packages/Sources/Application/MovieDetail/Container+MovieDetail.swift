import Common
import Factory

extension Container {
    var movieDetailBuilder: Factory<MovieDetailBuilding?> {
        self { MovieDetailBuilder() }
    }

    public func registerDetailDependencies() {
        movieDetailBuilder.register { MovieDetailBuilder() }
    }
}
