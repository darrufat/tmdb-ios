import Factory

extension Container {
    var imageConfigurationRepository: Factory<ImageConfigurationRepository?> { self { nil } }
    var moviesRepository: Factory<MoviesRepository?> { self { nil } }

    public var getImageConfigurationUseCase: Factory<GetImageConfigurationUseCase> {
        self { GetImageConfiguration() }
    }
    public var getDiscoveryMoviesUseCase: Factory<GetDiscoverMoviesUseCase> {
        self { GetDiscoverMovies() }
    }
    public var getMovieDetailUseCase: Factory<GetMovieDetailUseCase> {
        self { GetMovieDetail() }
    }
}
