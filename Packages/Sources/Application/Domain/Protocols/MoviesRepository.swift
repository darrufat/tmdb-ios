import Common

public protocol MoviesRepository {
    func getDiscoveryMovies(page: Int) async throws -> [MovieEntity]
}
