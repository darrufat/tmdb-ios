import Domain
import Factory

extension Container {
    public var moviesRepository: Factory<MoviesRepository?> {
        self { DefaultMoviesRepository() }
    }

    public func registerDataDependencies() {
        moviesRepository.register { DefaultMoviesRepository() }
    }
}
