import Domain
import Factory

extension Container {
    var imageConfigurationMemoryDataSource: Factory<ImageConfigurationDataSource> {
        self { ImageConfigurationMemoryDataSource() }
    }

    var imageConfigurationNetworkDataSource: Factory<ImageConfigurationDataSource> {
        self { ImageConfigurationNetworkDataSource() }
    }

    var imageConfigurationRepository: Factory<ImageConfigurationRepository?> {
        self { DefaultImageConfigurationRepository() }
    }

    var moviesRepository: Factory<MoviesRepository?> {
        self { DefaultMoviesRepository() }
    }

    public func registerDataDependencies() {
        imageConfigurationRepository.register { DefaultImageConfigurationRepository() }
        moviesRepository.register { DefaultMoviesRepository() }
    }
}
