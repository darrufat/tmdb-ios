import Factory

extension Container {
    public var moviesRepository: Factory<MoviesRepository?> { self { nil } }
    public var getDiscoveryMoviesUseCase: Factory<GetDiscoverMoviesUseCase> {
        self { GetDiscoverMovies() }
    }
}
