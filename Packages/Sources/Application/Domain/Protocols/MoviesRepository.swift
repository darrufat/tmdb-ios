import Common

public protocol MoviesRepository {
    func getDiscoveryMovies(page: Int) async throws -> [MovieEntity]
    func getDetail(id: String) async throws -> MovieDetailEntity
}
