import Common
import Domain
import Factory
import Foundation
import HTTPClient

struct DefaultMoviesRepository: MoviesRepository {
    @Injected(\.httpClient) private var httpClient

    func getDiscoveryMovies(page: Int) async throws -> [MovieEntity] {
        let dto = try await fetchDiscoveryMovies(page: page)
        return dto.results.map {
            .init(id: $0.id,
                  title: $0.title,
                  overview: $0.overview,
                  posterURL: $0.posterPath,
                  year: mapYear(releaseDate: $0.releaseDate),
                  voteAverage: $0.voteAverage)
        }
    }

    func getDetail(id: String) async throws -> MovieDetailEntity {
        let dto = try await fetchDetail(id: id)
        return MovieDetailEntity(id: dto.id,
                                 backgroundURL: dto.backdropPath,
                                 title: dto.title,
                                 originalTitle: dto.originalTitle,
                                 overview: dto.overview,
                                 year: mapYear(releaseDate: dto.releaseDate),
                                 voteAverage: dto.voteAverage)
    }
}

// To be moved to a NetworkDataSource if you need more data sources (local, memory...)
extension DefaultMoviesRepository {
    private func fetchDiscoveryMovies(page: Int) async throws -> MoviesDTO {
        guard let url = NetworkSettings.baseURL else {
            throw HTTPClientError.invalidURL
        }
        let request = HTTPRequest(url: url.appendingPathComponent("discover/movie"),
                                  method: .GET,
                                  params: [
                                    "api_key": NetworkSettings.apiKey,
                                    "page": "\(page)"
                                  ])
        let response = try await httpClient.fetch(request: request)

        guard let data = response.data else { throw HTTPClientError.response(response) }
        return try JSONDecoder().decode(MoviesDTO.self, from: data)
    }

    private func fetchDetail(id: String) async throws -> MovieDetailDTO {
        guard let url = NetworkSettings.baseURL else {
            throw HTTPClientError.invalidURL
        }
        let request = HTTPRequest(url: url.appendingPathComponent("movie/\(id)"),
                                  method: .GET,
                                  params: ["api_key": NetworkSettings.apiKey])
        let response = try await httpClient.fetch(request: request)
        guard let data = response.data else { throw HTTPClientError.response(response) }
        return try JSONDecoder().decode(MovieDetailDTO.self, from: data)
    }

    private func mapYear(releaseDate: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = dateFormatter.date(from: releaseDate) else { return nil }
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        return year
    }
}
