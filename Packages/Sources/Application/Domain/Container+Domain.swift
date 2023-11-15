import Factory

extension Container {
    var moviesRepository: Factory<MoviesRepository?> { self { nil } }
    public var getDiscoveryMoviesUseCase: Factory<GetDiscoverMoviesUseCase> {
        self { GetDiscoverMovies() }
    }
}
