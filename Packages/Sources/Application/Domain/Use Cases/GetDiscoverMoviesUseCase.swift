import Common
import Factory
import Foundation

public protocol GetDiscoverMoviesUseCase {
    func callAsFunction(page: Int) async throws -> [MovieEntity]
}

public struct GetDiscoverMovies: GetDiscoverMoviesUseCase {
    @Injected(\.moviesRepository) private var moviesRepository

    public func callAsFunction(page: Int) async throws -> [MovieEntity] {
        guard let moviesRepository else {
            throw NSError(domain: "Dependency missing", code: 1001)
        }
        return try await moviesRepository.getDiscoveryMovies(page: page)
    }
}
