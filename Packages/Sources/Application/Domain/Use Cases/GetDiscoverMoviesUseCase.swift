import Common
import Factory
import Foundation

public protocol GetDiscoverMoviesUseCase {
    func callAsFunction(page: Int) async throws -> [MovieEntity]
}

public struct GetDiscoverMovies: GetDiscoverMoviesUseCase {
    @Injected(\.moviesRepository) private var repository

    public func callAsFunction(page: Int) async throws -> [MovieEntity] {
        guard let repository else { throw NSError(domain: "Dependency missing", code: 1001) }
        return try await repository.getDiscoveryMovies(page: page)
    }
}
