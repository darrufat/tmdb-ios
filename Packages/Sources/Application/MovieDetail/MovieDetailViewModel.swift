import Combine
import Common
import Domain
import Factory
import Foundation

public final class MovieDetailViewModel: ObservableObject {
    @Injected(\.getMovieDetailUseCase) private var getMovieDetailUseCase

    let movieId: String
    @Published var state: ViewState
    @Published var detailModel: MovieDetailModel = .placeholder

    public init(state: ViewState = .idle, movieId: String) {
        self.state = state
        self.movieId = movieId
    }

    @MainActor
    func load() async {
        state = .loading
        do {
            try await loadDetail()
        } catch {
            //state = .failed(error) // TODO: handle error state
        }
    }

    @MainActor
    func refresh() async {
        do {
            try await loadDetail()
        } catch {}
    }

    @MainActor
    private func loadDetail() async throws {
        let entity = try await getMovieDetailUseCase(id: movieId)
        detailModel = .init(id: String(entity.id),
                            backgroundImageURL: URL(string: entity.backgroundURL),
                            title: entity.title,
                            originalTitle: entity.originalTitle,
                            summary: entity.overview,
                            rating: entity.voteAverage,
                            year: entity.year)
        state = .loaded
    }
}
