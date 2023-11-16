import Common
import Factory
import Foundation

public protocol GetMovieDetailUseCase {
    func callAsFunction(id: String) async throws -> MovieDetailEntity
}

public struct GetMovieDetail: GetMovieDetailUseCase {
    @Injected(\.moviesRepository) private var repository

    public func callAsFunction(id: String) async throws -> MovieDetailEntity {
        guard let repository else { throw NSError(domain: "Dependency missing", code: 1001) }
        return try await repository.getDetail(id: id)
    }
}
